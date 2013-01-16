with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Operations.EES,
--#    Tkmrpc.Operation_Handlers.EES.esa_acquire,
--#    Tkmrpc.Operation_Handlers.EES.esa_expire;

package Tkmrpc.Dispatchers.Ees is

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch EES request to concrete operation handler.
   --# derives Res from Req;

end Tkmrpc.Dispatchers.Ees;
