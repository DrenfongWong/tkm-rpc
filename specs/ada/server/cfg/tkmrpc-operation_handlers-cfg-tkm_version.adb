with Tkmrpc.Servers.Cfg;
with Tkmrpc.Response.Cfg.Tkm_Version.Convert;

package body Tkmrpc.Operation_Handlers.Cfg.Tkm_Version is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      --# accept W, 3, "Ignore Unreferenced pragma";
      pragma Unreferenced (Req);
      --# end accept;

      Specific_Res : Response.Cfg.Tkm_Version.Response_Type;
   begin
      Specific_Res := Response.Cfg.Tkm_Version.Null_Response;

      Servers.Cfg.Tkm_Version
        (Result  => Specific_Res.Header.Result,
         Version => Specific_Res.Data.Version);

      --# accept W, 13,
      --#        Response.CFG.tkm_version.Convert.To_Response,
      --#        "Validity is assured by preconditions";
      Res := Response.Cfg.Tkm_Version.Convert.To_Response (S => Specific_Res);
      --# end accept;
   end Handle;

end Tkmrpc.Operation_Handlers.Cfg.Tkm_Version;
