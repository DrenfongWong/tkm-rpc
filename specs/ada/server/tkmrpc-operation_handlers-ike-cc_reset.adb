with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.cc_reset.Convert;
with TKMRPC.Response.IKE.cc_reset.Convert;

package body TKMRPC.Operation_Handlers.IKE.cc_reset
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.cc_reset.Request_Type;
      Specific_Res   : Response.IKE.cc_reset.Response_Type;
   begin
      Specific_Req := Request.IKE.cc_reset.Convert.From_Request
        (S => Req);

      Servers.IKE.cc_reset
        (Result => Specific_Res.Header.Result,
         cc_id => Specific_Req.Data.cc_id);

      Res := Response.IKE.cc_reset.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.cc_reset;
