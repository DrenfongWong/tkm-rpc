with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.dh_create.Convert;
with TKMRPC.Response.IKE.dh_create.Convert;

package body TKMRPC.Operation_Handlers.IKE.dh_create
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.dh_create.Request_Type;
      Specific_Res   : Response.IKE.dh_create.Response_Type;
   begin
      Specific_Req := Request.IKE.dh_create.Convert.From_Request
        (S => Req);

      Servers.IKE.dh_create
        (Result => Specific_Res.Header.Result,
         dh_id => Specific_Req.Data.dh_id,
         dha_id => Specific_Req.Data.dha_id,
         pubvalue => Specific_Res.Data.pubvalue);

      Res := Response.IKE.dh_create.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.dh_create;
