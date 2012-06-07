with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.ae_reset.Convert;
with TKMRPC.Response.IKE.ae_reset.Convert;

package body TKMRPC.Operation_Handlers.IKE.ae_reset
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.ae_reset.Request_Type;
      Specific_Res   : Response.IKE.ae_reset.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.ae_reset.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.ae_reset
        (ae_id => Specific_Req.Data.ae_id,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.ae_reset.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.ae_reset;
