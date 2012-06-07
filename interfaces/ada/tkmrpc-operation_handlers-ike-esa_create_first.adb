with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.esa_create_first.Convert;
with TKMRPC.Response.IKE.esa_create_first.Convert;

package body TKMRPC.Operation_Handlers.IKE.esa_create_first
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.esa_create_first.Request_Type;
      Specific_Res   : Response.IKE.esa_create_first.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.esa_create_first.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.esa_create_first
        (esa_id => Specific_Req.Data.esa_id,
         isa_id => Specific_Req.Data.isa_id,
         sp_id => Specific_Req.Data.sp_id,
         ea_id => Specific_Req.Data.ea_id,
         esp_spi_loc => Specific_Req.Data.esp_spi_loc,
         esp_spi_rem => Specific_Req.Data.esp_spi_rem,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.esa_create_first.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.esa_create_first;
