with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers.Ike.Isa_Auth_Psk is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the isa_auth_psk operation.

end Tkmrpc.Operation_Handlers.Ike.Isa_Auth_Psk;
