with TKMRPC.Operations;
with TKMRPC.Operation_Handlers;

package TKMRPC.Operation_Dispatcher
is

   procedure Register
     (Handler : Operation_Handlers.Handler_Interface'Class;
      Opcode  : Operations.Operation_Type);
   --  Register handler for given operation code.

   procedure Start;
   --  Start dispatching of operation requests.

   procedure Stop;
   --  Stop operation dispatching.

   function Get_Handler_Count return Natural;
   --  Return number of registered handlers.

   procedure Clear;
   --  Clear all registered operation handlers.

   No_Handler   : exception;
   Opcode_Taken : exception;

end TKMRPC.Operation_Dispatcher;
