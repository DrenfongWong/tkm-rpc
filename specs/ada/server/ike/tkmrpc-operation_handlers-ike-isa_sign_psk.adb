with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Isa_Sign_Psk.Convert;
with Tkmrpc.Response.Ike.Isa_Sign_Psk.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Sign_Psk is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Sign_Psk.Request_Type;
      Specific_Res : Response.Ike.Isa_Sign_Psk.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Sign_Psk.Null_Response;

      Specific_Req :=
         Request.Ike.Isa_Sign_Psk.Convert.From_Request (S => Req);

      Servers.Ike.Isa_Sign_Psk
        (Result       => Specific_Res.Header.Result,
         Isa_Id       => Specific_Req.Data.Isa_Id,
         Init_Message => Specific_Req.Data.Init_Message,
         Idx          => Specific_Req.Data.Idx,
         Verify       => Specific_Req.Data.Verify,
         Signature    => Specific_Res.Data.Signature);

      Res :=
         Response.Ike.Isa_Sign_Psk.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Sign_Psk;
