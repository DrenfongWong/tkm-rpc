with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Nc_Reset.Convert;
with Tkmrpc.Response.Ike.Nc_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Nc_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Nc_Reset.Request_Type;
      Specific_Res : Response.Ike.Nc_Reset.Response_Type;
   begin
      Specific_Res := Response.Ike.Nc_Reset.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.nc_reset.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Nc_Reset.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Nc_Id'Valid then
         Servers.Ike.Nc_Reset
           (Result => Specific_Res.Header.Result,
            Nc_Id  => Specific_Req.Data.Nc_Id);

         --# accept W, 13,
         --#        Response.IKE.nc_reset.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res := Response.Ike.Nc_Reset.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Nc_Reset;
