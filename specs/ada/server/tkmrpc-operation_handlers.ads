with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers is

   type Op_Handler is not null access procedure
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Operation handler callback. Op handlers take care of operation requests
   --  identified by operation code (opcode). The Res data out parameter
   --  designates the response to the request.

end Tkmrpc.Operation_Handlers;
