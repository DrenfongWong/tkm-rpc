with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.isa_create.Convert,
--#    Tkmrpc.Response.IKE.isa_create.Convert;

package Tkmrpc.Operation_Handlers.Ike.Isa_Create is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the isa_create operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Isa_Create;
