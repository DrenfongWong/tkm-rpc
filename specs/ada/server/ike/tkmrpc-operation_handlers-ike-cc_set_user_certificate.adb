with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Cc_Set_User_Certificate.Convert;
with Tkmrpc.Response.Ike.Cc_Set_User_Certificate.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Cc_Set_User_Certificate is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Cc_Set_User_Certificate.Request_Type;
      Specific_Res : Response.Ike.Cc_Set_User_Certificate.Response_Type;
   begin
      Specific_Res := Response.Ike.Cc_Set_User_Certificate.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.cc_set_user_certificate.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req :=
         Request.Ike.Cc_Set_User_Certificate.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Cc_Id'Valid and
         Specific_Req.Data.Ri_Id'Valid and
         Specific_Req.Data.Autha_Id'Valid and
         Specific_Req.Data.Certificate.Size'Valid
      then
         Servers.Ike.Cc_Set_User_Certificate
           (Result      => Specific_Res.Header.Result,
            Cc_Id       => Specific_Req.Data.Cc_Id,
            Ri_Id       => Specific_Req.Data.Ri_Id,
            Autha_Id    => Specific_Req.Data.Autha_Id,
            Certificate => Specific_Req.Data.Certificate);

         --# accept W, 13,
         --#        Response.IKE.cc_set_user_certificate.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ike.Cc_Set_User_Certificate.Convert.To_Response
              (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Cc_Set_User_Certificate;
