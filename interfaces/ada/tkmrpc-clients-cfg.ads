with Interfaces.C.Strings;

with TKMRPC.Types;
with TKMRPC.Results;

package TKMRPC.Clients.CFG
is

   procedure Init
     (Result  : out Results.Result_Type;
      Address :     Interfaces.C.Strings.chars_ptr);
   pragma Export (C, Init, "cfg_init");
   --  Initialize CFG client with given address.

   procedure tkm_version
     (version : out Types.version_type;
      Result : out Results.Result_Type);
   pragma Export (C, tkm_version, "cfg_tkm_version");
   --  Returns the version of TKM.

   procedure tkm_limits
     (max_active_requests : out Types.active_requests_type;
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
      dha_contexts : out Types.dha_id_type;
      Result : out Results.Result_Type);
   pragma Export (C, tkm_limits, "cfg_tkm_limits");
   --  Returns limits of fixed length of TKM.

end TKMRPC.Clients.CFG;
