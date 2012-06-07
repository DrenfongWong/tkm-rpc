with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.cc_add_certificate.Convert;
with TKMRPC.Response.IKE.cc_add_certificate.Convert;

package body TKMRPC.Operation_Handlers.IKE.cc_add_certificate
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.cc_add_certificate.Request_Type;
      Specific_Res   : Response.IKE.cc_add_certificate.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.cc_add_certificate.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.cc_add_certificate
        (cc_id => Specific_Req.Data.cc_id,
         autha_id => Specific_Req.Data.autha_id,
         certificate => Specific_Req.Data.certificate,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.cc_add_certificate.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.cc_add_certificate;
