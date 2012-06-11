with Interfaces.C.Strings;

with Tkmrpc.Types;
with Tkmrpc.Results;

package Tkmrpc.Clients.Ike is

   procedure Init
     (Result  : out Results.Result_Type;
      Address : Interfaces.C.Strings.chars_ptr);
   pragma Export (C, Init, "ike_init");
   pragma Export_Valued_Procedure (Init);
   --  Initialize IKE client with given address.

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type);
   pragma Export (C, Tkm_Version, "ike_tkm_version");
   pragma Export_Valued_Procedure (Tkm_Version);
   --  Returns the version of TKM.

   procedure Tkm_Limits
     (Result              : out Results.Result_Type;
      Max_Active_Requests : out Types.Active_Requests_Type;
      Nc_Contexts         : out Types.Nc_Id_Type;
      Dh_Contexts         : out Types.Dh_Id_Type;
      Cc_Contexts         : out Types.Cc_Id_Type;
      Ae_Contexts         : out Types.Ae_Id_Type;
      Isa_Contexts        : out Types.Isa_Id_Type;
      Esa_Contexts        : out Types.Esa_Id_Type);
   pragma Export (C, Tkm_Limits, "ike_tkm_limits");
   pragma Export_Valued_Procedure (Tkm_Limits);
   --  Returns limits of fixed length of TKM.

   procedure Nc_Reset
     (Result : out Results.Result_Type;
      Nc_Id  : Types.Nc_Id_Type);
   pragma Export (C, Nc_Reset, "ike_nc_reset");
   pragma Export_Valued_Procedure (Nc_Reset);
   --  Reset a NC context.

   procedure Nc_Create
     (Result       : out Results.Result_Type;
      Nc_Id        : Types.Nc_Id_Type;
      Nonce_Length : Types.Nonce_Length_Type;
      Nonce        : out Types.Nonce_Type);
   pragma Export (C, Nc_Create, "ike_nc_create");
   pragma Export_Valued_Procedure (Nc_Create);
   --  Create a nonce.

   procedure Dh_Reset
     (Result : out Results.Result_Type;
      Dh_Id  : Types.Dh_Id_Type);
   pragma Export (C, Dh_Reset, "ike_dh_reset");
   pragma Export_Valued_Procedure (Dh_Reset);
   --  Reset a DH context.

   procedure Dh_Create
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Pubvalue : out Types.Dh_Pubvalue_Type);
   pragma Export (C, Dh_Create, "ike_dh_create");
   pragma Export_Valued_Procedure (Dh_Create);
   --  Create a DH secret and return its public value.

   procedure Dh_Generate_Key
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Pubvalue : Types.Dh_Pubvalue_Type);
   pragma Export (C, Dh_Generate_Key, "ike_dh_generate_key");
   pragma Export_Valued_Procedure (Dh_Generate_Key);
   --  Create a nonce.

   procedure Cc_Reset
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type);
   pragma Export (C, Cc_Reset, "ike_cc_reset");
   pragma Export_Valued_Procedure (Cc_Reset);
   --  Reset a CC context.

   procedure Cc_Set_User_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Ri_Id       : Types.Ri_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   pragma Export (C, Cc_Set_User_Certificate, "ike_cc_set_user_certificate");
   pragma Export_Valued_Procedure (Cc_Set_User_Certificate);
   --  Initiates a certificate chain starting from the user certificate.

   procedure Cc_Add_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   pragma Export (C, Cc_Add_Certificate, "ike_cc_add_certificate");
   pragma Export_Valued_Procedure (Cc_Add_Certificate);
   --  Add a certificate to a certificate chain.

   procedure Cc_Check_Ca
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type;
      Ca_Id  : Types.Ca_Id_Type);
   pragma Export (C, Cc_Check_Ca, "ike_cc_check_ca");
   pragma Export_Valued_Procedure (Cc_Check_Ca);
   --  Checks if a cc is based on a trusted CA

   procedure Ae_Reset
     (Result : out Results.Result_Type;
      Ae_Id  : Types.Ae_Id_Type);
   pragma Export (C, Ae_Reset, "ike_ae_reset");
   pragma Export_Valued_Procedure (Ae_Reset);
   --  Reset an AE context.

   procedure Isa_Reset
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   pragma Export (C, Isa_Reset, "ike_isa_reset");
   pragma Export_Valued_Procedure (Isa_Reset);
   --  Reset an ISA context.

   procedure Isa_Create
     (Result    : out Results.Result_Type;
      Isa_Id    : Types.Isa_Id_Type;
      Ae_Id     : Types.Ae_Id_Type;
      Ia_Id     : Types.Ia_Id_Type;
      Dh_Id     : Types.Dh_Id_Type;
      Nc_Loc_Id : Types.Nc_Id_Type;
      Nonce_Rem : Types.Nonce_Type;
      Initiator : Types.Init_Type;
      Spi_Loc   : Types.Ike_Spi_Type;
      Spi_Rem   : Types.Ike_Spi_Type;
      Sk_Ai     : out Types.Key_Type;
      Sk_Ar     : out Types.Key_Type;
      Sk_Ei     : out Types.Key_Type;
      Sk_Er     : out Types.Key_Type);
   pragma Export (C, Isa_Create, "ike_isa_create");
   pragma Export_Valued_Procedure (Isa_Create);
   --  Create an IKE SA context.

   procedure Isa_Sign
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Lc_Id        : Types.Lc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : out Types.Signature_Type);
   pragma Export (C, Isa_Sign, "ike_isa_sign");
   pragma Export_Valued_Procedure (Isa_Sign);
   --  Provide authentication to the remote endpoint.

   procedure Isa_Auth
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Cc_Id        : Types.Cc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : Types.Signature_Type);
   pragma Export (C, Isa_Auth, "ike_isa_auth");
   pragma Export_Valued_Procedure (Isa_Auth);
   --  Authenticate the remote endpoint.

   procedure Isa_Create_Child
     (Result        : out Results.Result_Type;
      Isa_Id        : Types.Isa_Id_Type;
      Parent_Isa_Id : Types.Isa_Id_Type;
      Ia_Id         : Types.Ia_Id_Type;
      Dh_Id         : Types.Dh_Id_Type;
      Nc_Loc_Id     : Types.Nc_Id_Type;
      Nonce_Rem     : Types.Nonce_Type;
      Initiator     : Types.Init_Type;
      Spi_Loc       : Types.Ike_Spi_Type;
      Spi_Rem       : Types.Ike_Spi_Type;
      Sk_Ai         : out Types.Key_Type;
      Sk_Ar         : out Types.Key_Type;
      Sk_Ei         : out Types.Key_Type;
      Sk_Er         : out Types.Key_Type);
   pragma Export (C, Isa_Create_Child, "ike_isa_create_child");
   pragma Export_Valued_Procedure (Isa_Create_Child);
   --  Derive an IKE SA context from an existing SA.

   procedure Isa_Skip_Create_First
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   pragma Export (C, Isa_Skip_Create_First, "ike_isa_skip_create_first");
   pragma Export_Valued_Procedure (Isa_Skip_Create_First);
   --  Don't create a first child.

   procedure Esa_Reset
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   pragma Export (C, Esa_Reset, "ike_esa_reset");
   pragma Export_Valued_Procedure (Esa_Reset);
   --  Reset an ESA context.

   procedure Esa_Create
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Dh_Id       : Types.Dh_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type);
   pragma Export (C, Esa_Create, "ike_esa_create");
   pragma Export_Valued_Procedure (Esa_Create);
   --  Creates an ESP SA.

   procedure Esa_Create_No_Pfs
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type);
   pragma Export (C, Esa_Create_No_Pfs, "ike_esa_create_no_pfs");
   pragma Export_Valued_Procedure (Esa_Create_No_Pfs);
   --  Creates an ESP SA without PFS.

   procedure Esa_Create_First
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type);
   pragma Export (C, Esa_Create_First, "ike_esa_create_first");
   pragma Export_Valued_Procedure (Esa_Create_First);
   --  Creates the first ESP SA for an AE.

   procedure Esa_Select
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   pragma Export (C, Esa_Select, "ike_esa_select");
   pragma Export_Valued_Procedure (Esa_Select);
   --  Selects an ESA context for outgoing traffic.

end Tkmrpc.Clients.Ike;
