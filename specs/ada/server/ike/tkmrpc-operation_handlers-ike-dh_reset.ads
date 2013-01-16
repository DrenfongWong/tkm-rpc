with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.dh_reset.Convert,
--#    Tkmrpc.Response.IKE.dh_reset.Convert;

package Tkmrpc.Operation_Handlers.Ike.Dh_Reset is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the dh_reset operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Dh_Reset;
