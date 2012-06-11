with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.cc_check_ca.Convert;
with TKMRPC.Response.IKE.cc_check_ca.Convert;

package body TKMRPC.Operation_Handlers.IKE.cc_check_ca
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.cc_check_ca.Request_Type;
      Specific_Res   : Response.IKE.cc_check_ca.Response_Type;
   begin
      Specific_Req := Request.IKE.cc_check_ca.Convert.From_Request
        (S => Req);

      Servers.IKE.cc_check_ca
        (Result => Specific_Res.Header.Result,
         cc_id => Specific_Req.Data.cc_id,
         ca_id => Specific_Req.Data.ca_id);

      Res := Response.IKE.cc_check_ca.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.cc_check_ca;
