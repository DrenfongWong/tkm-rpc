with Tkmrpc.Servers.Cfg;
with Tkmrpc.Response.Cfg.Tkm_Limits.Convert;

package body Tkmrpc.Operation_Handlers.Cfg.Tkm_Limits is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      pragma Unreferenced (Req);

      Specific_Res : Response.Cfg.Tkm_Limits.Response_Type;
   begin
      Specific_Res := Response.Cfg.Tkm_Limits.Null_Response;

      Servers.Cfg.Tkm_Limits
        (Result              => Specific_Res.Header.Result,
         Max_Active_Requests => Specific_Res.Data.Max_Active_Requests,
         Authag_Contexts     => Specific_Res.Data.Authag_Contexts,
         Cag_Contexts        => Specific_Res.Data.Cag_Contexts,
         Li_Contexts         => Specific_Res.Data.Li_Contexts,
         Ri_Contexts         => Specific_Res.Data.Ri_Contexts,
         Iag_Contexts        => Specific_Res.Data.Iag_Contexts,
         Eag_Contexts        => Specific_Res.Data.Eag_Contexts,
         Dhag_Contexts       => Specific_Res.Data.Dhag_Contexts,
         Sp_Contexts         => Specific_Res.Data.Sp_Contexts,
         Authp_Contexts      => Specific_Res.Data.Authp_Contexts,
         Dhp_Contexts        => Specific_Res.Data.Dhp_Contexts,
         Autha_Contexts      => Specific_Res.Data.Autha_Contexts,
         Ca_Contexts         => Specific_Res.Data.Ca_Contexts,
         Lc_Contexts         => Specific_Res.Data.Lc_Contexts,
         Ia_Contexts         => Specific_Res.Data.Ia_Contexts,
         Ea_Contexts         => Specific_Res.Data.Ea_Contexts,
         Dha_Contexts        => Specific_Res.Data.Dha_Contexts);

      Res := Response.Cfg.Tkm_Limits.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Cfg.Tkm_Limits;
