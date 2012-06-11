with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.nc_create
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the nc_create operation.

end TKMRPC.Operation_Handlers.IKE.nc_create;
