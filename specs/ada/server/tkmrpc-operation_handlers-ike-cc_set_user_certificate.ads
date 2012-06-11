with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.cc_set_user_certificate
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the cc_set_user_certificate operation.

end TKMRPC.Operation_Handlers.IKE.cc_set_user_certificate;
