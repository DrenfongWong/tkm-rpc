with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers.Ees.Esa_Acquire is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the esa_acquire operation.

end Tkmrpc.Operation_Handlers.Ees.Esa_Acquire;
