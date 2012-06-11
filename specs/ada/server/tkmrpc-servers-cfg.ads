with Tkmrpc.Types;
with Tkmrpc.Results;

package Tkmrpc.Servers.Cfg is

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type);
   --  Returns the version of TKM.

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
   --  Returns limits of fixed length of TKM.

end Tkmrpc.Servers.Cfg;
