with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Response.IKE.tkm_version.Convert;

package Tkmrpc.Operation_Handlers.Ike.Tkm_Version is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the tkm_version operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Tkm_Version;
