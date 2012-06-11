with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.esa_create_no_pfs.Convert;
with TKMRPC.Response.IKE.esa_create_no_pfs.Convert;

package body TKMRPC.Operation_Handlers.IKE.esa_create_no_pfs
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.esa_create_no_pfs.Request_Type;
      Specific_Res   : Response.IKE.esa_create_no_pfs.Response_Type;
   begin
      Specific_Req := Request.IKE.esa_create_no_pfs.Convert.From_Request
        (S => Req);

      Servers.IKE.esa_create_no_pfs
        (Result => Specific_Res.Header.Result,
         esa_id => Specific_Req.Data.esa_id,
         isa_id => Specific_Req.Data.isa_id,
         sp_id => Specific_Req.Data.sp_id,
         ea_id => Specific_Req.Data.ea_id,
         nc_loc_id => Specific_Req.Data.nc_loc_id,
         nonce_rem => Specific_Req.Data.nonce_rem,
         initiator => Specific_Req.Data.initiator,
         esp_spi_loc => Specific_Req.Data.esp_spi_loc,
         esp_spi_rem => Specific_Req.Data.esp_spi_rem);

      Res := Response.IKE.esa_create_no_pfs.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.esa_create_no_pfs;
