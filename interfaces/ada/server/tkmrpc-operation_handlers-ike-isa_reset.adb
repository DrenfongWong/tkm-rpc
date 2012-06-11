with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.isa_reset.Convert;
with TKMRPC.Response.IKE.isa_reset.Convert;

package body TKMRPC.Operation_Handlers.IKE.isa_reset
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req : Request.IKE.isa_reset.Request_Type;
      Specific_Res : Response.IKE.isa_reset.Response_Type;
   begin
      Specific_Req := Request.IKE.isa_reset.Convert.From_Request
        (S => Req);

      Servers.IKE.isa_reset
        (Result => Specific_Res.Header.Result,
         isa_id => Specific_Req.Data.isa_id);

      Res := Response.IKE.isa_reset.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.isa_reset;
