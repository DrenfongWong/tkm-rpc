with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.tkm_version
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the tkm_version operation.

end TKMRPC.Operation_Handlers.IKE.tkm_version;
