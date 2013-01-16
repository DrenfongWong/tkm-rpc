with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Operations.CFG,
--#    Tkmrpc.Operation_Handlers.CFG.tkm_version,
--#    Tkmrpc.Operation_Handlers.CFG.tkm_limits,
--#    Tkmrpc.Operation_Handlers.CFG.tkm_reset;

package Tkmrpc.Dispatchers.Cfg is

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch CFG request to concrete operation handler.
   --# derives Res from Req;

end Tkmrpc.Dispatchers.Cfg;
