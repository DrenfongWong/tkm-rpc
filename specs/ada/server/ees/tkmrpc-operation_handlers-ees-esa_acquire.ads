with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.EES,
--#    Tkmrpc.Request.EES.esa_acquire.Convert,
--#    Tkmrpc.Response.EES.esa_acquire.Convert;

package Tkmrpc.Operation_Handlers.Ees.Esa_Acquire is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the esa_acquire operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ees.Esa_Acquire;
