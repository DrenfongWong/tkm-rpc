with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Dispatchers.Cfg is

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch CFG  request to concrete operation handler.

end Tkmrpc.Dispatchers.Cfg;
