with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Isa_Auth_Psk.Convert;
with Tkmrpc.Response.Ike.Isa_Auth_Psk.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Auth_Psk is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Auth_Psk.Request_Type;
      Specific_Res : Response.Ike.Isa_Auth_Psk.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Auth_Psk.Null_Response;

      Specific_Req :=
         Request.Ike.Isa_Auth_Psk.Convert.From_Request (S => Req);

      Servers.Ike.Isa_Auth_Psk
        (Result    => Specific_Res.Header.Result,
         Isa_Id    => Specific_Req.Data.Isa_Id,
         Signature => Specific_Req.Data.Signature);

      Res :=
         Response.Ike.Isa_Auth_Psk.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Auth_Psk;
