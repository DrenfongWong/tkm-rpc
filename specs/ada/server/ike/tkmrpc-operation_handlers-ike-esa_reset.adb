with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Esa_Reset.Convert;
with Tkmrpc.Response.Ike.Esa_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Reset.Request_Type;
      Specific_Res : Response.Ike.Esa_Reset.Response_Type;
   begin
      Specific_Res := Response.Ike.Esa_Reset.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.esa_reset.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Esa_Reset.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Esa_Id'Valid then
         Servers.Ike.Esa_Reset
           (Result => Specific_Res.Header.Result,
            Esa_Id => Specific_Req.Data.Esa_Id);

         --# accept W, 13,
         --#        Response.IKE.esa_reset.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ike.Esa_Reset.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Reset;
