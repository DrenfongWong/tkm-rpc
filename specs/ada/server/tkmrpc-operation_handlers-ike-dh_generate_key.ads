with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the dh_generate_key operation.

end Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key;
