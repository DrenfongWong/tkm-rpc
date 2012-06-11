with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.isa_auth.Convert;
with TKMRPC.Response.IKE.isa_auth.Convert;

package body TKMRPC.Operation_Handlers.IKE.isa_auth
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.isa_auth.Request_Type;
      Specific_Res   : Response.IKE.isa_auth.Response_Type;
   begin
      Specific_Req := Request.IKE.isa_auth.Convert.From_Request
        (S => Req);

      Servers.IKE.isa_auth
        (Result => Specific_Res.Header.Result,
         isa_id => Specific_Req.Data.isa_id,
         cc_id => Specific_Req.Data.cc_id,
         init_message => Specific_Req.Data.init_message,
         signature => Specific_Req.Data.signature);

      Res := Response.IKE.isa_auth.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.isa_auth;
