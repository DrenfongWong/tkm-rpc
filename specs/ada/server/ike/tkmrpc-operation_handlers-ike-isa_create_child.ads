with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.isa_create_child.Convert,
--#    Tkmrpc.Response.IKE.isa_create_child.Convert;

package Tkmrpc.Operation_Handlers.Ike.Isa_Create_Child is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the isa_create_child operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Isa_Create_Child;
