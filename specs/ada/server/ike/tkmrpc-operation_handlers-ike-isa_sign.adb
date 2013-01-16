with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Isa_Sign.Convert;
with Tkmrpc.Response.Ike.Isa_Sign.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Sign is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Sign.Request_Type;
      Specific_Res : Response.Ike.Isa_Sign.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Sign.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.isa_sign.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Isa_Sign.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Isa_Id'Valid and
         Specific_Req.Data.Lc_Id'Valid and
         Specific_Req.Data.Init_Message.Size'Valid
      then
         Servers.Ike.Isa_Sign
           (Result       => Specific_Res.Header.Result,
            Isa_Id       => Specific_Req.Data.Isa_Id,
            Lc_Id        => Specific_Req.Data.Lc_Id,
            Init_Message => Specific_Req.Data.Init_Message,
            Signature    => Specific_Res.Data.Signature);

         --# accept W, 13,
         --#        Response.IKE.isa_sign.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res := Response.Ike.Isa_Sign.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Sign;
