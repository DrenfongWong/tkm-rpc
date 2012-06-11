with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Esa_Create.Convert;
with Tkmrpc.Response.Ike.Esa_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Create.Request_Type;
      Specific_Res : Response.Ike.Esa_Create.Response_Type;
   begin
      Specific_Req := Request.Ike.Esa_Create.Convert.From_Request (S => Req);

      Servers.Ike.Esa_Create
        (Result      => Specific_Res.Header.Result,
         Esa_Id      => Specific_Req.Data.Esa_Id,
         Isa_Id      => Specific_Req.Data.Isa_Id,
         Sp_Id       => Specific_Req.Data.Sp_Id,
         Ea_Id       => Specific_Req.Data.Ea_Id,
         Dh_Id       => Specific_Req.Data.Dh_Id,
         Nc_Loc_Id   => Specific_Req.Data.Nc_Loc_Id,
         Nonce_Rem   => Specific_Req.Data.Nonce_Rem,
         Initiator   => Specific_Req.Data.Initiator,
         Esp_Spi_Loc => Specific_Req.Data.Esp_Spi_Loc,
         Esp_Spi_Rem => Specific_Req.Data.Esp_Spi_Rem);

      Res := Response.Ike.Esa_Create.Convert.To_Response (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Create;