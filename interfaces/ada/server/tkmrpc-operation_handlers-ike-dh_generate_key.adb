with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.dh_generate_key.Convert;
with TKMRPC.Response.IKE.dh_generate_key.Convert;

package body TKMRPC.Operation_Handlers.IKE.dh_generate_key
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.dh_generate_key.Request_Type;
      Specific_Res   : Response.IKE.dh_generate_key.Response_Type;
   begin
      Specific_Req := Request.IKE.dh_generate_key.Convert.From_Request
        (S => Req);

      Servers.IKE.dh_generate_key
        (Result => Specific_Res.Header.Result,
         dh_id => Specific_Req.Data.dh_id,
         pubvalue => Specific_Req.Data.pubvalue);

      Res := Response.IKE.dh_generate_key.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.dh_generate_key;
