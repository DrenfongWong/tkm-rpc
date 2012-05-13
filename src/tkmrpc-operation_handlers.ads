with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers
is

   type Handler_Interface is interface;
   --  Operation handler interface. An operation handler takes care of an
   --  operation request identified by operation code (opcode).

   procedure Handle
     (H   :     Handler_Interface;
      Req :     Request.Data_Type;
      Res : out Response.Data_Type) is abstract;
   --  Handle request given by request data. The Res data out parameter
   --  designates the response to the request.

end TKMRPC.Operation_Handlers;
