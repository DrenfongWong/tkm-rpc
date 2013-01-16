with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Isa_Auth.Convert;
with Tkmrpc.Response.Ike.Isa_Auth.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Auth is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Auth.Request_Type;
      Specific_Res : Response.Ike.Isa_Auth.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Auth.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.isa_auth.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Isa_Auth.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Isa_Id'Valid and
         Specific_Req.Data.Cc_Id'Valid and
         Specific_Req.Data.Init_Message.Size'Valid and
         Specific_Req.Data.Signature.Size'Valid
      then
         Servers.Ike.Isa_Auth
           (Result       => Specific_Res.Header.Result,
            Isa_Id       => Specific_Req.Data.Isa_Id,
            Cc_Id        => Specific_Req.Data.Cc_Id,
            Init_Message => Specific_Req.Data.Init_Message,
            Signature    => Specific_Req.Data.Signature);

         --# accept W, 13,
         --#        Response.IKE.isa_auth.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res := Response.Ike.Isa_Auth.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Auth;
