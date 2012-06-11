with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.esa_reset.Convert;
with TKMRPC.Response.IKE.esa_reset.Convert;

package body TKMRPC.Operation_Handlers.IKE.esa_reset
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.esa_reset.Request_Type;
      Specific_Res   : Response.IKE.esa_reset.Response_Type;
   begin
      Specific_Req := Request.IKE.esa_reset.Convert.From_Request
        (S => Req);

      Servers.IKE.esa_reset
        (Result => Specific_Res.Header.Result,
         esa_id => Specific_Req.Data.esa_id);

      Res := Response.IKE.esa_reset.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.esa_reset;
