with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers.Ike.Dh_Get_Shared_Secret is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the dh_get_shared_secret operation.

end Tkmrpc.Operation_Handlers.Ike.Dh_Get_Shared_Secret;
