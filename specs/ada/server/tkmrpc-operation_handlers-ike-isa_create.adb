with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.isa_create.Convert;
with TKMRPC.Response.IKE.isa_create.Convert;

package body TKMRPC.Operation_Handlers.IKE.isa_create
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.isa_create.Request_Type;
      Specific_Res   : Response.IKE.isa_create.Response_Type;
   begin
      Specific_Req := Request.IKE.isa_create.Convert.From_Request
        (S => Req);

      Servers.IKE.isa_create
        (Result => Specific_Res.Header.Result,
         isa_id => Specific_Req.Data.isa_id,
         ae_id => Specific_Req.Data.ae_id,
         ia_id => Specific_Req.Data.ia_id,
         dh_id => Specific_Req.Data.dh_id,
         nc_loc_id => Specific_Req.Data.nc_loc_id,
         nonce_rem => Specific_Req.Data.nonce_rem,
         initiator => Specific_Req.Data.initiator,
         spi_loc => Specific_Req.Data.spi_loc,
         spi_rem => Specific_Req.Data.spi_rem,
         sk_ai => Specific_Res.Data.sk_ai,
         sk_ar => Specific_Res.Data.sk_ar,
         sk_ei => Specific_Res.Data.sk_ei,
         sk_er => Specific_Res.Data.sk_er);

      Res := Response.IKE.isa_create.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.isa_create;
