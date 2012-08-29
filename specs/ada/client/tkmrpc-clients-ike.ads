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

   procedure Tkm_Reset (Result : out Results.Result_Type);
   pragma Export (C, Tkm_Reset, "ike_tkm_reset");
   pragma Export_Valued_Procedure (Tkm_Reset);
   --  Reset the TKM - IKE interface to a known initial state.

   procedure Nc_Reset
     (Result : out Results.Result_Type;
      Nc_Id  : Types.Nc_Id_Type);
   pragma Export (C, Nc_Reset, "ike_nc_reset");
   pragma Export_Valued_Procedure (Nc_Reset, Mechanism => (Nc_Id => Value));
   --  Reset a NC context.

   procedure Nc_Create
     (Result       : out Results.Result_Type;
      Nc_Id        : Types.Nc_Id_Type;
      Nonce_Length : Types.Nonce_Length_Type;
      Nonce        : out Types.Nonce_Type);
   pragma Export (C, Nc_Create, "ike_nc_create");
   pragma Export_Valued_Procedure
     (Nc_Create,
      Mechanism => (Nc_Id => Value, Nonce_Length => Value));
   --  Create a nonce.

   procedure Dh_Reset
     (Result : out Results.Result_Type;
      Dh_Id  : Types.Dh_Id_Type);
   pragma Export (C, Dh_Reset, "ike_dh_reset");
   pragma Export_Valued_Procedure (Dh_Reset, Mechanism => (Dh_Id => Value));
   --  Reset a DH context.

   procedure Dh_Create
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Pubvalue : out Types.Dh_Pubvalue_Type);
   pragma Export (C, Dh_Create, "ike_dh_create");
   pragma Export_Valued_Procedure
     (Dh_Create,
      Mechanism => (Dh_Id => Value, Dha_Id => Value));
   --  Create a DH secret and return its public value.

   procedure Dh_Generate_Key
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Pubvalue : Types.Dh_Pubvalue_Type);
   pragma Export (C, Dh_Generate_Key, "ike_dh_generate_key");
   pragma Export_Valued_Procedure
     (Dh_Generate_Key,
      Mechanism => (Dh_Id => Value, Pubvalue => Value));
   --  Create a nonce.

   procedure Dh_Get_Shared_Secret
     (Result       : out Results.Result_Type;
      Dh_Id        : Types.Dh_Id_Type;
      Sharedsecret : out Types.Dh_Key_Type);
   pragma Export (C, Dh_Get_Shared_Secret, "ike_dh_get_shared_secret");
   pragma Export_Valued_Procedure
     (Dh_Get_Shared_Secret,
      Mechanism => (Dh_Id => Value));
   --  Return the DH shared secret value.

   procedure Cc_Reset
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type);
   pragma Export (C, Cc_Reset, "ike_cc_reset");
   pragma Export_Valued_Procedure (Cc_Reset, Mechanism => (Cc_Id => Value));
   --  Reset a CC context.

   procedure Cc_Set_User_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Ri_Id       : Types.Ri_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   pragma Export (C, Cc_Set_User_Certificate, "ike_cc_set_user_certificate");
   pragma Export_Valued_Procedure
     (Cc_Set_User_Certificate,
      Mechanism =>
     (Cc_Id       => Value,
      Ri_Id       => Value,
      Autha_Id    => Value,
      Certificate => Value));
   --  Initiates a certificate chain starting from the user certificate.

   procedure Cc_Add_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   pragma Export (C, Cc_Add_Certificate, "ike_cc_add_certificate");
   pragma Export_Valued_Procedure
     (Cc_Add_Certificate,
      Mechanism => (Cc_Id => Value, Autha_Id => Value, Certificate => Value));
   --  Add a certificate to a certificate chain.

   procedure Cc_Check_Ca
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type;
      Ca_Id  : Types.Ca_Id_Type);
   pragma Export (C, Cc_Check_Ca, "ike_cc_check_ca");
   pragma Export_Valued_Procedure
     (Cc_Check_Ca,
      Mechanism => (Cc_Id => Value, Ca_Id => Value));
   --  Checks if a cc is based on a trusted CA

   procedure Ae_Reset
     (Result : out Results.Result_Type;
      Ae_Id  : Types.Ae_Id_Type);
   pragma Export (C, Ae_Reset, "ike_ae_reset");
   pragma Export_Valued_Procedure (Ae_Reset, Mechanism => (Ae_Id => Value));
   --  Reset an AE context.

   procedure Isa_Reset
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   pragma Export (C, Isa_Reset, "ike_isa_reset");
   pragma Export_Valued_Procedure
     (Isa_Reset,
      Mechanism => (Isa_Id => Value));
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
   pragma Export_Valued_Procedure
     (Isa_Create,
      Mechanism =>
     (Isa_Id    => Value,
      Ae_Id     => Value,
      Ia_Id     => Value,
      Dh_Id     => Value,
      Nc_Loc_Id => Value,
      Nonce_Rem => Value,
      Initiator => Value,
      Spi_Loc   => Value,
      Spi_Rem   => Value));
   --  Create an IKE SA context.

   procedure Isa_Sign
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Lc_Id        : Types.Lc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : out Types.Signature_Type);
   pragma Export (C, Isa_Sign, "ike_isa_sign");
   pragma Export_Valued_Procedure
     (Isa_Sign,
      Mechanism => (Isa_Id => Value, Lc_Id => Value, Init_Message => Value));
   --  Provide authentication to the remote endpoint.

   procedure Isa_Sign_Psk
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Idx          : Types.Idx_Type;
      Signature    : out Types.Signature_Type);
   pragma Export (C, Isa_Sign_Psk, "ike_isa_sign_psk");
   pragma Export_Valued_Procedure
     (Isa_Sign_Psk,
      Mechanism => (Isa_Id => Value, Init_Message => Value, Idx => Value));
   --  Provide authentication to the remote endpoint using PSK.

   procedure Isa_Auth
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Cc_Id        : Types.Cc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : Types.Signature_Type);
   pragma Export (C, Isa_Auth, "ike_isa_auth");
   pragma Export_Valued_Procedure
     (Isa_Auth,
      Mechanism =>
     (Isa_Id       => Value,
      Cc_Id        => Value,
      Init_Message => Value,
      Signature    => Value));
   --  Authenticate the remote endpoint.

   procedure Isa_Auth_Psk
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Idx          : Types.Idx_Type;
      Signature    : out Types.Signature_Type);
   pragma Export (C, Isa_Auth_Psk, "ike_isa_auth_psk");
   pragma Export_Valued_Procedure
     (Isa_Auth_Psk,
      Mechanism => (Isa_Id => Value, Init_Message => Value, Idx => Value));
   --  Authenticate the remote endpoint using PSK.

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
   pragma Export_Valued_Procedure
     (Isa_Create_Child,
      Mechanism =>
     (Isa_Id        => Value,
      Parent_Isa_Id => Value,
      Ia_Id         => Value,
      Dh_Id         => Value,
      Nc_Loc_Id     => Value,
      Nonce_Rem     => Value,
      Initiator     => Value,
      Spi_Loc       => Value,
      Spi_Rem       => Value));
   --  Derive an IKE SA context from an existing SA.

   procedure Isa_Skip_Create_First
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   pragma Export (C, Isa_Skip_Create_First, "ike_isa_skip_create_first");
   pragma Export_Valued_Procedure
     (Isa_Skip_Create_First,
      Mechanism => (Isa_Id => Value));
   --  Don't create a first child.

   procedure Esa_Reset
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   pragma Export (C, Esa_Reset, "ike_esa_reset");
   pragma Export_Valued_Procedure
     (Esa_Reset,
      Mechanism => (Esa_Id => Value));
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
   pragma Export_Valued_Procedure
     (Esa_Create,
      Mechanism =>
     (Esa_Id      => Value,
      Isa_Id      => Value,
      Sp_Id       => Value,
      Ea_Id       => Value,
      Dh_Id       => Value,
      Nc_Loc_Id   => Value,
      Nonce_Rem   => Value,
      Initiator   => Value,
      Esp_Spi_Loc => Value,
      Esp_Spi_Rem => Value));
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
   pragma Export_Valued_Procedure
     (Esa_Create_No_Pfs,
      Mechanism =>
     (Esa_Id      => Value,
      Isa_Id      => Value,
      Sp_Id       => Value,
      Ea_Id       => Value,
      Nc_Loc_Id   => Value,
      Nonce_Rem   => Value,
      Initiator   => Value,
      Esp_Spi_Loc => Value,
      Esp_Spi_Rem => Value));
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
   pragma Export_Valued_Procedure
     (Esa_Create_First,
      Mechanism =>
     (Esa_Id      => Value,
      Isa_Id      => Value,
      Sp_Id       => Value,
      Ea_Id       => Value,
      Esp_Spi_Loc => Value,
      Esp_Spi_Rem => Value));
   --  Creates the first ESP SA for an AE.

   procedure Esa_Select
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   pragma Export (C, Esa_Select, "ike_esa_select");
   pragma Export_Valued_Procedure
     (Esa_Select,
      Mechanism => (Esa_Id => Value));
   --  Selects an ESA context for outgoing traffic.

end Tkmrpc.Clients.Ike;
