with TKMRPC.Servers.CFG;
with TKMRPC.Response.CFG.tkm_version.Convert;

package body TKMRPC.Operation_Handlers.CFG.tkm_version
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (Req);

      Specific_Res   : Response.CFG.tkm_version.Response_Type;
   begin
      Servers.CFG.tkm_version
        (Result => Specific_Res.Header.Result,
         version => Specific_Res.Data.version);

      Res := Response.CFG.tkm_version.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.CFG.tkm_version;
