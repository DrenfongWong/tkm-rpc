with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Operation_Handlers.IKE.cc_check_ca
is

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Handler for the cc_check_ca operation.

end TKMRPC.Operation_Handlers.IKE.cc_check_ca;
