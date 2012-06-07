with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Dispatchers.CFG
is

   procedure Dispatch
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch CFG  request to concrete operation handler.

end TKMRPC.Dispatchers.CFG;
