with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Esa_Create.Convert;
with Tkmrpc.Response.Ike.Esa_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Create.Request_Type;
      Specific_Res : Response.Ike.Esa_Create.Response_Type;
   begin
      Specific_Res := Response.Ike.Esa_Create.Null_Response;

      Specific_Req := Request.Ike.Esa_Create.Convert.From_Request (S => Req);

      if Specific_Req.Data.Esa_Id'Valid and
         Specific_Req.Data.Isa_Id'Valid and
         Specific_Req.Data.Sp_Id'Valid and
         Specific_Req.Data.Ea_Id'Valid and
         Specific_Req.Data.Dh_Id'Valid and
         Specific_Req.Data.Nc_Loc_Id'Valid and
         Specific_Req.Data.Nonce_Rem.Size'Valid and
         Specific_Req.Data.Initiator'Valid and
         Specific_Req.Data.Esp_Spi_Loc'Valid and
         Specific_Req.Data.Esp_Spi_Rem'Valid
      then
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

         Res :=
            Response.Ike.Esa_Create.Convert.To_Response (S => Specific_Res);

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Create;
