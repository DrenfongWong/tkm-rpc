with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers.Ike.Nc_Reset is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the nc_reset operation.

end Tkmrpc.Operation_Handlers.Ike.Nc_Reset;
