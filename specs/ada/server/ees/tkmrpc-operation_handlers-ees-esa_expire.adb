with Tkmrpc.Servers.Ees;
with Tkmrpc.Results;
with Tkmrpc.Request.Ees.Esa_Expire.Convert;
with Tkmrpc.Response.Ees.Esa_Expire.Convert;

package body Tkmrpc.Operation_Handlers.Ees.Esa_Expire is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ees.Esa_Expire.Request_Type;
      Specific_Res : Response.Ees.Esa_Expire.Response_Type;
   begin
      Specific_Res := Response.Ees.Esa_Expire.Null_Response;

      --# accept W, 13,
      --#        Request.EES.esa_expire.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ees.Esa_Expire.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Sp_Id'Valid and
         Specific_Req.Data.Spi_Rem'Valid and
         Specific_Req.Data.Protocol'Valid and
         Specific_Req.Data.Hard'Valid
      then
         Servers.Ees.Esa_Expire
           (Result   => Specific_Res.Header.Result,
            Sp_Id    => Specific_Req.Data.Sp_Id,
            Spi_Rem  => Specific_Req.Data.Spi_Rem,
            Protocol => Specific_Req.Data.Protocol,
            Hard     => Specific_Req.Data.Hard);

         --# accept W, 13,
         --#        Response.EES.esa_expire.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ees.Esa_Expire.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ees.Esa_Expire;
