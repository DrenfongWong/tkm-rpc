with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.cc_set_user_certificate.Convert;
with TKMRPC.Response.IKE.cc_set_user_certificate.Convert;

package body TKMRPC.Operation_Handlers.IKE.cc_set_user_certificate
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.cc_set_user_certificate.Request_Type;
      Specific_Res   : Response.IKE.cc_set_user_certificate.Response_Type;
   begin
      Specific_Req := Request.IKE.cc_set_user_certificate.Convert.From_Request
        (S => Req);

      Servers.IKE.cc_set_user_certificate
        (Result => Specific_Res.Header.Result,
         cc_id => Specific_Req.Data.cc_id,
         ri_id => Specific_Req.Data.ri_id,
         autha_id => Specific_Req.Data.autha_id,
         certificate => Specific_Req.Data.certificate);

      Res := Response.IKE.cc_set_user_certificate.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.cc_set_user_certificate;
