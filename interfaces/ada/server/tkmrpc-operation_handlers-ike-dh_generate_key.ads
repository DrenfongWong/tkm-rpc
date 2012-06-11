with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.dh_generate_key
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the dh_generate_key operation.

end TKMRPC.Operation_Handlers.IKE.dh_generate_key;
