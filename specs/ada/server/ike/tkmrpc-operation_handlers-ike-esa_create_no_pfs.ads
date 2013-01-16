with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.esa_create_no_pfs.Convert,
--#    Tkmrpc.Response.IKE.esa_create_no_pfs.Convert;

package Tkmrpc.Operation_Handlers.Ike.Esa_Create_No_Pfs is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the esa_create_no_pfs operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Esa_Create_No_Pfs;
