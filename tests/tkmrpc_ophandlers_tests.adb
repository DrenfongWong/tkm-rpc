with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Client;
with TKMRPC.Operation_Handlers;
with TKMRPC.Operation_Dispatcher;
with TKMRPC.Constants;

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
   --  Test implementation of an operation handler. Asserts that the request
   --  equals Test_Request and sets Res to Test_Response.

   -------------------------------------------------------------------------

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

      Assert (Condition => Request_Correct,
              Message   => "Request mismatch");
      Assert (Condition => Res = Test_Utils.Test_Response,
              Message   => "Response mismatch");

      --  Test behavior on unknown/invalid request

      declare
         Res             : Response.Data_Type;
         Unknown_Request : constant Request.Data_Type
           := (Header      =>
                 (Operation  => 12345,
                  Request_ID => 3464564),
               Padded_Data => (others => Character'Pos ('g')));
         Ref_Response    : Response.Data_Type
           := Constants.Invalid_Operation;
      begin
         Ref_Response.Header.Request_ID := Unknown_Request.Header.Request_ID;
         Client.Send (Data => Unknown_Request);
         Client.Receive (Data => Res);

         Assert (Condition => Res = Ref_Response,
                 Message   => "Invalid operation expected");
      end;

      Operation_Dispatcher.Stop;

   exception
      when others =>
         Operation_Dispatcher.Stop;
         raise;
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