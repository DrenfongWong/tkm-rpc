with Tkmrpc.Request;
with Tkmrpc.Response;
with Tkmrpc.Transport.Client;
with Tkmrpc.Transport.Servers;

with Test_Utils;

package body Tkmrpc_Ophandlers_Tests
is
   use Ahven;
   use Tkmrpc;

   Request_Correct : Boolean := False;

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Test implementation of an operation handler callback. Asserts that the
   --  request equals Test_Request and sets Res to Test_Response.

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      use type Tkmrpc.Request.Data_Type;
   begin
      if Req = Test_Utils.Test_Request then
         Request_Correct := True;
      end if;

      Res := Test_Utils.Test_Response;
   end Handle;

   -------------------------------------------------------------------------

   procedure Handle_Requests
   is
      use type Tkmrpc.Response.Data_Type;

      Res        : Response.Data_Type;
      RPC_Server : Transport.Servers.Server_Type;
   begin
      Transport.Servers.Listen
        (Server  => RPC_Server,
         Address => Test_Utils.Communication_Socket,
         Process => Handle'Access);

      Transport.Client.Connect (Address => Test_Utils.Communication_Socket);
      select
         delay 3.0;
         Transport.Servers.Stop (Server => RPC_Server);
         Fail (Message => "Test aborted");
      then abort
         Transport.Client.Send (Data => Test_Utils.Test_Request);
         Transport.Client.Receive (Data => Res);
      end select;

      Assert (Condition => Request_Correct,
              Message   => "Request mismatch");
      Assert (Condition => Res = Test_Utils.Test_Response,
              Message   => "Response mismatch");

      Transport.Servers.Stop (Server => RPC_Server);

   exception
      when others =>
         if Transport.Servers.Is_Listening (Server => RPC_Server) then
            Transport.Servers.Stop (Server => RPC_Server);
         end if;
         raise;
   end Handle_Requests;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Operation handler tests");
      T.Add_Test_Routine
        (Routine => Handle_Requests'Access,
         Name    => "Handle operation requests");
   end Initialize;

end Tkmrpc_Ophandlers_Tests;
