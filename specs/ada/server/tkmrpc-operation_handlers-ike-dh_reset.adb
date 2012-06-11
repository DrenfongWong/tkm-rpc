with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.dh_reset.Convert;
with TKMRPC.Response.IKE.dh_reset.Convert;

package body TKMRPC.Operation_Handlers.IKE.dh_reset
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.dh_reset.Request_Type;
      Specific_Res   : Response.IKE.dh_reset.Response_Type;
   begin
      Specific_Req := Request.IKE.dh_reset.Convert.From_Request
        (S => Req);

      Servers.IKE.dh_reset
        (Result => Specific_Res.Header.Result,
         dh_id => Specific_Req.Data.dh_id);

      Res := Response.IKE.dh_reset.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.dh_reset;
