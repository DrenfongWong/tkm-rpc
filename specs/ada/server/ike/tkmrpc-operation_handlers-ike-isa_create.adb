with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Isa_Create.Convert;
with Tkmrpc.Response.Ike.Isa_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Create.Request_Type;
      Specific_Res : Response.Ike.Isa_Create.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Create.Null_Response;

      Specific_Req := Request.Ike.Isa_Create.Convert.From_Request (S => Req);

      if Specific_Req.Data.Isa_Id'Valid and
         Specific_Req.Data.Ae_Id'Valid and
         Specific_Req.Data.Ia_Id'Valid and
         Specific_Req.Data.Dh_Id'Valid and
         Specific_Req.Data.Nc_Loc_Id'Valid and
         Specific_Req.Data.Nonce_Rem.Size'Valid and
         Specific_Req.Data.Initiator'Valid and
         Specific_Req.Data.Spi_Loc'Valid and
         Specific_Req.Data.Spi_Rem'Valid
      then
         Servers.Ike.Isa_Create
           (Result    => Specific_Res.Header.Result,
            Isa_Id    => Specific_Req.Data.Isa_Id,
            Ae_Id     => Specific_Req.Data.Ae_Id,
            Ia_Id     => Specific_Req.Data.Ia_Id,
            Dh_Id     => Specific_Req.Data.Dh_Id,
            Nc_Loc_Id => Specific_Req.Data.Nc_Loc_Id,
            Nonce_Rem => Specific_Req.Data.Nonce_Rem,
            Initiator => Specific_Req.Data.Initiator,
            Spi_Loc   => Specific_Req.Data.Spi_Loc,
            Spi_Rem   => Specific_Req.Data.Spi_Rem,
            Sk_Ai     => Specific_Res.Data.Sk_Ai,
            Sk_Ar     => Specific_Res.Data.Sk_Ar,
            Sk_Ei     => Specific_Res.Data.Sk_Ei,
            Sk_Er     => Specific_Res.Data.Sk_Er);

         Res :=
            Response.Ike.Isa_Create.Convert.To_Response (S => Specific_Res);

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Create;
