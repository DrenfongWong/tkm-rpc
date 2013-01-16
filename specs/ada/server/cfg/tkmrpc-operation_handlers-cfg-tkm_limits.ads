with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.CFG,
--#    Tkmrpc.Response.CFG.tkm_limits.Convert;

package Tkmrpc.Operation_Handlers.Cfg.Tkm_Limits is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the tkm_limits operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Cfg.Tkm_Limits;
