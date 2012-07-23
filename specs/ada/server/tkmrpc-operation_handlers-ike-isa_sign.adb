with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Isa_Sign.Convert;
with Tkmrpc.Response.Ike.Isa_Sign.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Sign is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Sign.Request_Type;
      Specific_Res : Response.Ike.Isa_Sign.Response_Type;
   begin
      Specific_Req := Request.Ike.Isa_Sign.Convert.From_Request (S => Req);

      Servers.Ike.Isa_Sign
        (Result       => Specific_Res.Header.Result,
         Isa_Id       => Specific_Req.Data.Isa_Id,
         Lc_Id        => Specific_Req.Data.Lc_Id,
         Init_Message => Specific_Req.Data.Init_Message,
         Signature    => Specific_Res.Data.Signature);

      Res := Response.Ike.Isa_Sign.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Sign;
