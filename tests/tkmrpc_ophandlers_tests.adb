with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Client;
with TKMRPC.Operation_Handlers;
with TKMRPC.Operation_Dispatcher;

with Test_Utils;

package body TKMRPC_Ophandlers_Tests
is
   use Ahven;
   use TKMRPC;

   Request_Correct : Boolean := False;

   type My_Handler is new
     Operation_Handlers.Handler_Interface with null record;

   overriding
   procedure Handle
     (H   :     My_Handler;
      Req :     Request.Data_Type;
      Res : out Response.Data_Type);

   procedure Handle
     (H   :     My_Handler;
      Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (H);

      use type TKMRPC.Request.Data_Type;
   begin
      if Req = Test_Utils.Test_Request then
         Request_Correct := True;
      end if;

      Res := Test_Utils.Test_Response;
   end Handle;

   -------------------------------------------------------------------------

   procedure Handle_Requests
   is
      use type TKMRPC.Response.Data_Type;

      Res : Response.Data_Type;
      H   : My_Handler;
   begin
      Operation_Dispatcher.Register (Handler => H,
                                     Opcode  => Test_Utils.Test_Operation);
      Operation_Dispatcher.Start;

      Client.Connect (Address => Communication_Socket);
      select
         delay 3.0;
         Operation_Dispatcher.Stop;
         Fail (Message => "Test aborted");
      then abort
         Client.Send (Data => Test_Utils.Test_Request);
         Client.Receive (Data => Res);
      end select;

      Operation_Dispatcher.Stop;

      Assert (Condition => Request_Correct,
              Message   => "Request mismatch");
      Assert (Condition => Res = Test_Utils.Test_Response,
              Message   => "Response mismatch");
   end Handle_Requests;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Operation handler tests");
      T.Add_Test_Routine
        (Routine => Register_Handlers'Access,
         Name    => "Register operation handlers");
      T.Add_Test_Routine
        (Routine => Handle_Requests'Access,
         Name    => "Handle operation requests");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Register_Handlers
   is
      H : My_Handler;
   begin
      Assert (Condition => Operation_Dispatcher.Get_Handler_Count = 0,
              Message   => "Handler count not 0");

      Operation_Dispatcher.Register (Handler => H,
                                     Opcode  => 999);
      Assert (Condition => Operation_Dispatcher.Get_Handler_Count = 1,
              Message   => "Handler count not 1");

      begin
         Operation_Dispatcher.Register (Handler => H,
                                        Opcode  => 999);
         Fail (Message => "Exception expected");

      exception
         when Operation_Dispatcher.Opcode_Taken => null;
      end;

      Operation_Dispatcher.Clear;
   end Register_Handlers;

end TKMRPC_Ophandlers_Tests;
