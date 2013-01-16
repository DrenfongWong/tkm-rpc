with Interfaces.C.Strings;

with Tkmrpc.Types;
with Tkmrpc.Results;

package Tkmrpc.Clients.Cfg is

   procedure Init
     (Result  : out Results.Result_Type;
      Address : Interfaces.C.Strings.chars_ptr);
   pragma Export (C, Init, "cfg_init");
   pragma Export_Valued_Procedure (Init);
   --  Initialize CFG client with given address.

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type);
   pragma Export (C, Tkm_Version, "cfg_tkm_version");
   pragma Export_Valued_Procedure (Tkm_Version);
   --  Returns the version of TKM.
   --# global State;
   --# derives
   --#    Result,
   --#    version
   --#          from State;

   procedure Tkm_Limits
     (Result              : out Results.Result_Type;
      Max_Active_Requests : out Types.Active_Requests_Type;
      Authag_Contexts     : out Types.Authag_Id_Type;
      Cag_Contexts        : out Types.Cag_Id_Type;
      Li_Contexts         : out Types.Li_Id_Type;
      Ri_Contexts         : out Types.Ri_Id_Type;
      Iag_Contexts        : out Types.Iag_Id_Type;
      Eag_Contexts        : out Types.Eag_Id_Type;
      Dhag_Contexts       : out Types.Dhag_Id_Type;
      Sp_Contexts         : out Types.Sp_Id_Type;
      Authp_Contexts      : out Types.Authp_Id_Type;
      Dhp_Contexts        : out Types.Dhp_Id_Type;
      Autha_Contexts      : out Types.Autha_Id_Type;
      Ca_Contexts         : out Types.Ca_Id_Type;
      Lc_Contexts         : out Types.Lc_Id_Type;
      Ia_Contexts         : out Types.Ia_Id_Type;
      Ea_Contexts         : out Types.Ea_Id_Type;
      Dha_Contexts        : out Types.Dha_Id_Type);
   pragma Export (C, Tkm_Limits, "cfg_tkm_limits");
   pragma Export_Valued_Procedure (Tkm_Limits);
   --  Returns limits of fixed length of TKM.
   --# global State;
   --# derives
   --#    Result,
   --#    max_active_requests,
   --#    authag_contexts,
   --#    cag_contexts,
   --#    li_contexts,
   --#    ri_contexts,
   --#    iag_contexts,
   --#    eag_contexts,
   --#    dhag_contexts,
   --#    sp_contexts,
   --#    authp_contexts,
   --#    dhp_contexts,
   --#    autha_contexts,
   --#    ca_contexts,
   --#    lc_contexts,
   --#    ia_contexts,
   --#    ea_contexts,
   --#    dha_contexts
   --#          from State;

   procedure Tkm_Reset (Result : out Results.Result_Type);
   pragma Export (C, Tkm_Reset, "cfg_tkm_reset");
   pragma Export_Valued_Procedure (Tkm_Reset);
   --  Reset the TKM - CFG interface to a known initial state.
   --# global State;
   --# derives
   --#    Result
   --#          from State;

end Tkmrpc.Clients.Cfg;
