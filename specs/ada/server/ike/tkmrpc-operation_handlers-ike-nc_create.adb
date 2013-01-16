with
  Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Nc_Create.Convert;
with Tkmrpc.Response.Ike.Nc_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Nc_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Nc_Create.Request_Type;
      Specific_Res : Response.Ike.Nc_Create.Response_Type;
   begin
      Specific_Res := Response.Ike.Nc_Create.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.nc_create.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Nc_Create.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Nc_Id'Valid and
         Specific_Req.Data.Nonce_Length'Valid
      then
         Servers.Ike.Nc_Create
           (Result       => Specific_Res.Header.Result,
            Nc_Id        => Specific_Req.Data.Nc_Id,
            Nonce_Length => Specific_Req.Data.Nonce_Length,
            Nonce        => Specific_Res.Data.Nonce);

         --# accept W, 13,
         --#        Response.IKE.nc_create.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ike.Nc_Create.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Nc_Create;
