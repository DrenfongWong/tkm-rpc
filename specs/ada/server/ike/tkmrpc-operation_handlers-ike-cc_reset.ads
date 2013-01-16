with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.cc_reset.Convert,
--#    Tkmrpc.Response.IKE.cc_reset.Convert;

package Tkmrpc.Operation_Handlers.Ike.Cc_Reset is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the cc_reset operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Cc_Reset;
