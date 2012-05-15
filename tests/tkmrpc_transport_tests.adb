with Ada.Exceptions;

with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Transport.Servers;
with TKMRPC.Transport.Client;

with Test_Utils;

package body TKMRPC_Transport_Tests
is
   use Ahven;
   use TKMRPC;
   use TKMRPC.Transport;

   Socket_Path     : constant String := "/tmp/tkmrpc.socket";
   Request_Correct : Boolean         := False;
   Ex_Correct      : Boolean         := False;

   procedure Receive_Cb (Data : Request.Data_Type);
   --  Receive callback; Sets the Request_Correct boolean to True if the given
   --  request data matches the expected test request.

   procedure Receive_Cb_Raise (Data : Request.Data_Type);
   --  Raises an exception on request reception.

   procedure Respond_Cb (Data : out Response.Data_Type);
   --  Response callback; Send test response data.

   procedure Error_Cb
     (E         :        Ada.Exceptions.Exception_Occurrence;
      Stop_Flag : in out Boolean);
   --  RPC server error handler callback for testing purposes. It checks the
   --  exception identity and tells the server to terminate by setting the stop
   --  flag.

   -------------------------------------------------------------------------

   procedure Error_Cb
     (E         :        Ada.Exceptions.Exception_Occurrence;
      Stop_Flag : in out Boolean)
   is
      use type Ada.Exceptions.Exception_Id;
   begin
      if Ada.Exceptions.Exception_Identity (E) = Program_Error'Identity then
         Ex_Correct := True;
      end if;
      Stop_Flag := True;
   end Error_Cb;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Transport layer tests");
      T.Add_Test_Routine
        (Routine => Request_Response_Transport'Access,
         Name    => "RPC client/server");
      T.Add_Test_Routine
        (Routine => Server_Error_Callbacks'Access,
         Name    => "RPC server error callbacks");
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

   procedure Receive_Cb_Raise (Data : Request.Data_Type)
   is
   begin
      raise Program_Error with "Don't PANIC: test exception";
   end Receive_Cb_Raise;

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

   -------------------------------------------------------------------------

   procedure Server_Error_Callbacks
   is
      RPC_Server : Servers.Server_Type;
      Counter    : Natural := 0;
   begin
      Servers.Register_Error_Handler (Server   => RPC_Server,
                                      Callback => Error_Cb'Access);
      Servers.Listen (Server  => RPC_Server,
                      Address => Socket_Path,
                      Receive => Receive_Cb_Raise'Access,
                      Respond => Respond_Cb'Access);
      Assert (Condition => Servers.Is_Listening (Server => RPC_Server),
              Message   => "Server not listening");

      Client.Connect (Address => Socket_Path);
      Client.Send (Data => Test_Utils.Test_Request);

      --  Give the server some time to terminate

      loop
         exit when not Servers.Is_Listening (Server => RPC_Server)
           or Counter = 20;
         Counter := Counter + 1;
         delay 0.1;
      end loop;

      Assert (Condition => not Servers.Is_Listening (Server => RPC_Server),
              Message   => "Server still listening");
      Assert (Condition => Ex_Correct,
              Message   => "Exception mismatch");

   exception
      when others =>
         if Servers.Is_Listening (Server => RPC_Server) then
            Servers.Stop (Server => RPC_Server);
         end if;
         raise;
   end Server_Error_Callbacks;

end TKMRPC_Transport_Tests;
