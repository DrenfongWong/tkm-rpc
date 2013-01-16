with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.dh_create.Convert,
--#    Tkmrpc.Response.IKE.dh_create.Convert;

package Tkmrpc.Operation_Handlers.Ike.Dh_Create is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the dh_create operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Dh_Create;
