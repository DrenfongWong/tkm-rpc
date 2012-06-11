with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.isa_skip_create_first.Convert;
with TKMRPC.Response.IKE.isa_skip_create_first.Convert;

package body TKMRPC.Operation_Handlers.IKE.isa_skip_create_first
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.isa_skip_create_first.Request_Type;
      Specific_Res   : Response.IKE.isa_skip_create_first.Response_Type;
   begin
      Specific_Req := Request.IKE.isa_skip_create_first.Convert.From_Request
        (S => Req);

      Servers.IKE.isa_skip_create_first
        (Result => Specific_Res.Header.Result,
         isa_id => Specific_Req.Data.isa_id);

      Res := Response.IKE.isa_skip_create_first.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.isa_skip_create_first;
