with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Isa_Auth.Convert;
with Tkmrpc.Response.Ike.Isa_Auth.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Auth is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Auth.Request_Type;
      Specific_Res : Response.Ike.Isa_Auth.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Auth.Null_Response;

      Specific_Req := Request.Ike.Isa_Auth.Convert.From_Request (S => Req);

      Servers.Ike.Isa_Auth
        (Result       => Specific_Res.Header.Result,
         Isa_Id       => Specific_Req.Data.Isa_Id,
         Cc_Id        => Specific_Req.Data.Cc_Id,
         Init_Message => Specific_Req.Data.Init_Message,
         Signature    => Specific_Req.Data.Signature);

      Res := Response.Ike.Isa_Auth.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Auth;
