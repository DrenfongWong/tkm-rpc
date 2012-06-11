with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.esa_reset
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the esa_reset operation.

end TKMRPC.Operation_Handlers.IKE.esa_reset;
