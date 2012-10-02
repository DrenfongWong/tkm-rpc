with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Dispatchers.Ees is

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch EES request to concrete operation handler.

end Tkmrpc.Dispatchers.Ees;
