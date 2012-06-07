with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Transport.Client;
with TKMRPC.Operation_Dispatcher;

with Test_Utils;

package body TKMRPC_Ophandlers_Tests
is
   use Ahven;
   use TKMRPC;

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
   begin
      Operation_Dispatcher.Register (Handler => Handle'Access,
                                     Opcode  => Test_Utils.Test_Operation);
      Operation_Dispatcher.Start;

      Transport.Client.Connect (Address => Communication_Socket);
      select
         delay 3.0;
         Operation_Dispatcher.Stop;
         Fail (Message => "Test aborted");
      then abort
         Transport.Client.Send (Data => Test_Utils.Test_Request);
         Transport.Client.Receive (Data => Res);
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
         Ref_Response    : Response.Data_Type := Response.Null_Data;
      begin
         Ref_Response.Header.Request_ID := Unknown_Request.Header.Request_ID;
         Transport.Client.Send (Data => Unknown_Request);
         Transport.Client.Receive (Data => Res);

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
   begin
      Assert (Condition => Operation_Dispatcher.Get_Handler_Count = 0,
              Message   => "Handler count not 0");

      Operation_Dispatcher.Register (Handler => Handle'Access,
                                     Opcode  => 999);
      Assert (Condition => Operation_Dispatcher.Get_Handler_Count = 1,
              Message   => "Handler count not 1");

      begin
         Operation_Dispatcher.Register (Handler => Handle'Access,
                                        Opcode  => 999);
         Fail (Message => "Exception expected");

      exception
         when Operation_Dispatcher.Opcode_Taken => null;
      end;

      Operation_Dispatcher.Clear;
      Assert (Condition => Operation_Dispatcher.Get_Handler_Count = 0,
              Message   => "Handlers not cleared");
   end Register_Handlers;

end TKMRPC_Ophandlers_Tests;
