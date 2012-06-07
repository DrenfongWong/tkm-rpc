with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.CFG.tkm_limits
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the tkm_limits operation.

end TKMRPC.Operation_Handlers.CFG.tkm_limits;
