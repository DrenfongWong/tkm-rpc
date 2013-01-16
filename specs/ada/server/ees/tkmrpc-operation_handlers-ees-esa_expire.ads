with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.EES,
--#    Tkmrpc.Request.EES.esa_expire.Convert,
--#    Tkmrpc.Response.EES.esa_expire.Convert;

package Tkmrpc.Operation_Handlers.Ees.Esa_Expire is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the esa_expire operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ees.Esa_Expire;
