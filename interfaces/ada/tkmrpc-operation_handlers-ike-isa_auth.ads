with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.isa_auth
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the isa_auth operation.

end TKMRPC.Operation_Handlers.IKE.isa_auth;
