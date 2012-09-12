with Tkmrpc.Types;
with Tkmrpc.Results;

package Tkmrpc.Servers.Ike
is

   procedure Init;
   --  Initialize IKE server.

   procedure Finalize;
   --  Finalize IKE server.

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type);
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
   --  Returns limits of fixed length of TKM.

   procedure Tkm_Reset (Result : out Results.Result_Type);
   --  Reset the TKM - IKE interface to a known initial state.

   procedure Nc_Reset
     (Result : out Results.Result_Type;
      Nc_Id  : Types.Nc_Id_Type);
   --  Reset a NC context.

   procedure Nc_Create
     (Result       : out Results.Result_Type;
      Nc_Id        : Types.Nc_Id_Type;
      Nonce_Length : Types.Nonce_Length_Type;
      Nonce        : out Types.Nonce_Type);
   --  Create a nonce.

   procedure Dh_Reset
     (Result : out Results.Result_Type;
      Dh_Id  : Types.Dh_Id_Type);
   --  Reset a DH context.

   procedure Dh_Create
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Pubvalue : out Types.Dh_Pubvalue_Type);
   --  Create a DH secret and return its public value.

   procedure Dh_Generate_Key
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Pubvalue : Types.Dh_Pubvalue_Type);
   --  Create a nonce.

   procedure Cc_Reset
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type);
   --  Reset a CC context.

   procedure Cc_Set_User_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Ri_Id       : Types.Ri_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   --  Initiates a certificate chain starting from the user certificate.

   procedure Cc_Add_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   --  Add a certificate to a certificate chain.

   procedure Cc_Check_Ca
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type;
      Ca_Id  : Types.Ca_Id_Type);
   --  Checks if a cc is based on a trusted CA

   procedure Ae_Reset
     (Result : out Results.Result_Type;
      Ae_Id  : Types.Ae_Id_Type);
   --  Reset an AE context.

   procedure Isa_Reset
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
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
   --  Create an IKE SA context.

   procedure Isa_Sign
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Lc_Id        : Types.Lc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : out Types.Signature_Type);
   --  Provide authentication to the remote endpoint.

   procedure Isa_Sign_Psk
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Idx          : Types.Idx_Type;
      Verify       : Types.Verify_Type;
      Signature    : out Types.Signature_Type);
   --  Provide authentication octets using PSK.

   procedure Isa_Auth
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Cc_Id        : Types.Cc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : Types.Signature_Type);
   --  Authenticate the remote endpoint.

   procedure Isa_Auth_Psk
     (Result    : out Results.Result_Type;
      Isa_Id    : Types.Isa_Id_Type;
      Signature : Types.Signature_Type);
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
   --  Derive an IKE SA context from an existing SA.

   procedure Isa_Skip_Create_First
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   --  Don't create a first child.

   procedure Esa_Reset
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
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
   --  Creates an ESP SA without PFS.

   procedure Esa_Create_First
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type);
   --  Creates the first ESP SA for an AE.

   procedure Esa_Select
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   --  Selects an ESA context for outgoing traffic.

end Tkmrpc.Servers.Ike;
