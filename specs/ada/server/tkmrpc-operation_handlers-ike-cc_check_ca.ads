with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the cc_check_ca operation.

end Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca;
