with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.ae_reset.Convert,
--#    Tkmrpc.Response.IKE.ae_reset.Convert;

package Tkmrpc.Operation_Handlers.Ike.Ae_Reset is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the ae_reset operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Ae_Reset;
