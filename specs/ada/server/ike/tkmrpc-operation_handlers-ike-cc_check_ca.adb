with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Cc_Check_Ca.Convert;
with Tkmrpc.Response.Ike.Cc_Check_Ca.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Cc_Check_Ca.Request_Type;
      Specific_Res : Response.Ike.Cc_Check_Ca.Response_Type;
   begin
      Specific_Res := Response.Ike.Cc_Check_Ca.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.cc_check_ca.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Cc_Check_Ca.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Cc_Id'Valid and
         Specific_Req.Data.Ca_Id'Valid
      then
         Servers.Ike.Cc_Check_Ca
           (Result => Specific_Res.Header.Result,
            Cc_Id  => Specific_Req.Data.Cc_Id,
            Ca_Id  => Specific_Req.Data.Ca_Id);

         --# accept W, 13,
         --#        Response.IKE.cc_check_ca.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ike.Cc_Check_Ca.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca;
