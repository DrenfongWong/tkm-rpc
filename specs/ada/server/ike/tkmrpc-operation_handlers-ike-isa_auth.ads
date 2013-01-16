with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.isa_auth.Convert,
--#    Tkmrpc.Response.IKE.isa_auth.Convert;

package Tkmrpc.Operation_Handlers.Ike.Isa_Auth is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the isa_auth operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Isa_Auth;
