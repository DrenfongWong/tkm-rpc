package body TKMRPC.Servers.CFG
is

   -------------------------------------------------------------------------

   procedure tkm_limits
     (Result : out Results.Result_Type;
      max_active_requests : out Types.active_requests_type;
      authag_contexts : out Types.authag_id_type;
      cag_contexts : out Types.cag_id_type;
      li_contexts : out Types.li_id_type;
      ri_contexts : out Types.ri_id_type;
      iag_contexts : out Types.iag_id_type;
      eag_contexts : out Types.eag_id_type;
      dhag_contexts : out Types.dhag_id_type;
      sp_contexts : out Types.sp_id_type;
      authp_contexts : out Types.authp_id_type;
      dhp_contexts : out Types.dhp_id_type;
      autha_contexts : out Types.autha_id_type;
      ca_contexts : out Types.ca_id_type;
      lc_contexts : out Types.lc_id_type;
      ia_contexts : out Types.ia_id_type;
      ea_contexts : out Types.ea_id_type;
      dha_contexts : out Types.dha_id_type)
   is
      pragma Unreferenced (max_active_requests);
      pragma Unreferenced (authag_contexts);
      pragma Unreferenced (cag_contexts);
      pragma Unreferenced (li_contexts);
      pragma Unreferenced (ri_contexts);
      pragma Unreferenced (iag_contexts);
      pragma Unreferenced (eag_contexts);
      pragma Unreferenced (dhag_contexts);
      pragma Unreferenced (sp_contexts);
      pragma Unreferenced (authp_contexts);
      pragma Unreferenced (dhp_contexts);
      pragma Unreferenced (autha_contexts);
      pragma Unreferenced (ca_contexts);
      pragma Unreferenced (lc_contexts);
      pragma Unreferenced (ia_contexts);
      pragma Unreferenced (ea_contexts);
      pragma Unreferenced (dha_contexts);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end tkm_limits;

   -------------------------------------------------------------------------

   procedure tkm_version
     (Result : out Results.Result_Type;
      version : out Types.version_type)
   is
      pragma Unreferenced (version);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end tkm_version;

end TKMRPC.Servers.CFG;
