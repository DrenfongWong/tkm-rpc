with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.Nonce_Create
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the Nonce_Create operation.

end TKMRPC.Operation_Handlers.Nonce_Create;
