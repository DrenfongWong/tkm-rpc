with TKMRPC.Servers.IKE;
with TKMRPC.Response.IKE.tkm_version.Convert;

package body TKMRPC.Operation_Handlers.IKE.tkm_version
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (Req);

      Specific_Res   : Response.IKE.tkm_version.Response_Type;
   begin
      Servers.IKE.tkm_version
        (Result => Specific_Res.Header.Result,
         version => Specific_Res.Data.version);

      Res := Response.IKE.tkm_version.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.tkm_version;
