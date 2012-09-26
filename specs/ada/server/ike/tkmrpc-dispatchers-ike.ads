with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Dispatchers.Ike is

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch IKE  request to concrete operation handler.

end Tkmrpc.Dispatchers.Ike;
