with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.esa_create_first.Convert,
--#    Tkmrpc.Response.IKE.esa_create_first.Convert;

package Tkmrpc.Operation_Handlers.Ike.Esa_Create_First is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the esa_create_first operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Esa_Create_First;
