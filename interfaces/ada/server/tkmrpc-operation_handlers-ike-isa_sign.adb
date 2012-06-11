with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.isa_sign.Convert;
with TKMRPC.Response.IKE.isa_sign.Convert;

package body TKMRPC.Operation_Handlers.IKE.isa_sign
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.isa_sign.Request_Type;
      Specific_Res   : Response.IKE.isa_sign.Response_Type;
   begin
      Specific_Req := Request.IKE.isa_sign.Convert.From_Request
        (S => Req);

      Servers.IKE.isa_sign
        (Result => Specific_Res.Header.Result,
         isa_id => Specific_Req.Data.isa_id,
         lc_id => Specific_Req.Data.lc_id,
         init_message => Specific_Req.Data.init_message,
         signature => Specific_Res.Data.signature);

      Res := Response.IKE.isa_sign.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.isa_sign;
