with Tkmrpc.Servers.Cfg;
with Tkmrpc.Response.Cfg.Tkm_Version.Convert;

package body Tkmrpc.Operation_Handlers.Cfg.Tkm_Version is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      pragma Unreferenced (Req);

      Specific_Res : Response.Cfg.Tkm_Version.Response_Type;
   begin
      Servers.Cfg.Tkm_Version
        (Result  => Specific_Res.Header.Result,
         Version => Specific_Res.Data.Version);

      Res := Response.Cfg.Tkm_Version.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Cfg.Tkm_Version;
