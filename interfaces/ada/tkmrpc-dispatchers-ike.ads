with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Dispatchers.IKE
is

   procedure Dispatch
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch IKE  request to concrete operation handler.

end TKMRPC.Dispatchers.IKE;
