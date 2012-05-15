with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.Nonce_Create
is
   type Nonce_Create_Type is new Handler_Interface with private;
   --  Handler for the Nonce_Create operation.

   overriding
   procedure Handle
     (H   :     Nonce_Create_Type;
      Req :     Request.Data_Type;
      Res : out Response.Data_Type);

private

   type Nonce_Create_Type is new Handler_Interface with null record;

end TKMRPC.Operation_Handlers.Nonce_Create;
