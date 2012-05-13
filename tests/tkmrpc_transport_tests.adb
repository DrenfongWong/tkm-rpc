with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Servers;
with TKMRPC.Client;

with Test_Utils;

package body TKMRPC_Transport_Tests
is
   use Ahven;
   use TKMRPC;

   Socket_Path     : constant String := "/tmp/tkmrpc.socket";
   Request_Correct : Boolean         := False;

   procedure Receive_Cb (Data : Request.Data_Type);
   --  Receive callback; Sets the Request_Correct boolean to True if the given
   --  request data matches the expected test request.

   procedure Respond_Cb (Data : out Response.Data_Type);
   --  Response callback; Send test response data.

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Transport layer tests");
      T.Add_Test_Routine
        (Routine => Request_Response_Transport'Access,
         Name    => "RPC client/server");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Receive_Cb (Data : Request.Data_Type)
   is
      use type TKMRPC.Request.Data_Type;
   begin
      if Data = Test_Utils.Test_Request then
         Request_Correct := True;
      end if;
   end Receive_Cb;

   -------------------------------------------------------------------------

   procedure Request_Response_Transport
   is
      use type TKMRPC.Response.Data_Type;

      Server : Servers.Server_Type;
      Res    : Response.Data_Type;
   begin
      Servers.Listen (Server  => Server,
                      Address => Socket_Path,
                      Receive => Receive_Cb'Access,
                      Respond => Respond_Cb'Access);

      Client.Connect (Address => Socket_Path);
      select
         delay 3.0;
         Fail (Message => "Test aborted");
      then abort
         Client.Send (Data => Test_Utils.Test_Request);
         Client.Receive (Data => Res);
      end select;

      Servers.Stop (Server => Server);

      Assert (Condition => Request_Correct,
              Message   => "Request mismatch");
      Assert (Condition => Res = Test_Utils.Test_Response,
              Message   => "Response mismatch");
   end Request_Response_Transport;

   -------------------------------------------------------------------------

   procedure Respond_Cb (Data : out Response.Data_Type)
   is
   begin
      Data := Test_Utils.Test_Response;
   end Respond_Cb;

end TKMRPC_Transport_Tests;
