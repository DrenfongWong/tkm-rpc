with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.esa_select.Convert,
--#    Tkmrpc.Response.IKE.esa_select.Convert;

package Tkmrpc.Operation_Handlers.Ike.Esa_Select is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the esa_select operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Esa_Select;
