with Tkmrpc.Types;
with Tkmrpc.Results;

--# inherit
--#    Tkmrpc.Types,
--#    Tkmrpc.Results;

package Tkmrpc.Servers.Ike
   --# own State : State_Type;
   --# initializes State;
is

   --# type State_Type is abstract;

   procedure Init;
   --  Initialize IKE server.
   --# global State;
   --# derives State from *;

   procedure Finalize;
   --  Finalize IKE server.
   --# global State;
   --# derives State from *;

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type);
   --  Returns the version of TKM.
   --# global State;
   --# derives
   --#    Result,
   --#    version
   --#          from State;

   procedure Tkm_Limits
     (Result              : out Results.Result_Type;
      Max_Active_Requests : out Types.Active_Requests_Type;
      Nc_Contexts         : out Types.Nc_Id_Type;
      Dh_Contexts         : out Types.Dh_Id_Type;
      Cc_Contexts         : out Types.Cc_Id_Type;
      Ae_Contexts         : out Types.Ae_Id_Type;
      Isa_Contexts        : out Types.Isa_Id_Type;
      Esa_Contexts        : out Types.Esa_Id_Type);
   --  Returns limits of fixed length of TKM IKE.
   --# global State;
   --# derives
   --#    Result,
   --#    max_active_requests,
   --#    nc_contexts,
   --#    dh_contexts,
   --#    cc_contexts,
   --#    ae_contexts,
   --#    isa_contexts,
   --#    esa_contexts
   --#          from State;

   procedure Tkm_Reset (Result : out Results.Result_Type);
   --  Reset the TKM - IKE interface to a known initial state.
   --# global State;
   --# derives
   --#    Result
   --#          from State;

   procedure Nc_Reset
     (Result : out Results.Result_Type;
      Nc_Id  : Types.Nc_Id_Type);
   --  Reset a NC context.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               nc_id;

   procedure Nc_Create
     (Result       : out Results.Result_Type;
      Nc_Id        : Types.Nc_Id_Type;
      Nonce_Length : Types.Nonce_Length_Type;
      Nonce        : out Types.Nonce_Type);
   --  Create a nonce.
   --# global State;
   --# derives
   --#    Result,
   --#    nonce
   --#          from State,
   --#               nc_id,
   --#               nonce_length;

   procedure Dh_Reset
     (Result : out Results.Result_Type;
      Dh_Id  : Types.Dh_Id_Type);
   --  Reset a DH context.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               dh_id;

   procedure Dh_Create
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Pubvalue : out Types.Dh_Pubvalue_Type);
   --  Create a DH secret and return its public value.
   --# global State;
   --# derives
   --#    Result,
   --#    pubvalue
   --#          from State,
   --#               dh_id,
   --#               dha_id;

   procedure Dh_Generate_Key
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Pubvalue : Types.Dh_Pubvalue_Type);
   --  Generate a DH shared secret.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               dh_id,
   --#               pubvalue;

   procedure Cc_Reset
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type);
   --  Reset a CC context.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               cc_id;

   procedure Cc_Set_User_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Ri_Id       : Types.Ri_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   --  Initiates a certificate chain starting from the user certificate.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               cc_id,
   --#               ri_id,
   --#               autha_id,
   --#               certificate;

   procedure Cc_Add_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type);
   --  Add a certificate to a certificate chain.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               cc_id,
   --#               autha_id,
   --#               certificate;

   procedure Cc_Check_Ca
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type;
      Ca_Id  : Types.Ca_Id_Type);
   --  Checks if a cc is based on a trusted CA
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               cc_id,
   --#               ca_id;

   procedure Ae_Reset
     (Result : out Results.Result_Type;
      Ae_Id  : Types.Ae_Id_Type);
   --  Reset an AE context.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               ae_id;

   procedure Isa_Reset
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   --  Reset an ISA context.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               isa_id;

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
   --# global State;
   --# derives
   --#    Result,
   --#    sk_ai,
   --#    sk_ar,
   --#    sk_ei,
   --#    sk_er
   --#          from State,
   --#               isa_id,
   --#               ae_id,
   --#               ia_id,
   --#               dh_id,
   --#               nc_loc_id,
   --#               nonce_rem,
   --#               initiator,
   --#               spi_loc,
   --#               spi_rem;

   procedure Isa_Sign
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Lc_Id        : Types.Lc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : out Types.Signature_Type);
   --  Provide authentication to the remote endpoint.
   --# global State;
   --# derives
   --#    Result,
   --#    signature
   --#          from State,
   --#               isa_id,
   --#               lc_id,
   --#               init_message;

   procedure Isa_Auth
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Cc_Id        : Types.Cc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : Types.Signature_Type);
   --  Authenticate the remote endpoint.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               isa_id,
   --#               cc_id,
   --#               init_message,
   --#               signature;

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
   --# global State;
   --# derives
   --#    Result,
   --#    sk_ai,
   --#    sk_ar,
   --#    sk_ei,
   --#    sk_er
   --#          from State,
   --#               isa_id,
   --#               parent_isa_id,
   --#               ia_id,
   --#               dh_id,
   --#               nc_loc_id,
   --#               nonce_rem,
   --#               initiator,
   --#               spi_loc,
   --#               spi_rem;

   procedure Isa_Skip_Create_First
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type);
   --  Don't create a first child.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               isa_id;

   procedure Esa_Reset
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   --  Reset an ESA context.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               esa_id;

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
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               esa_id,
   --#               isa_id,
   --#               sp_id,
   --#               ea_id,
   --#               dh_id,
   --#               nc_loc_id,
   --#               nonce_rem,
   --#               initiator,
   --#               esp_spi_loc,
   --#               esp_spi_rem;

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
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               esa_id,
   --#               isa_id,
   --#               sp_id,
   --#               ea_id,
   --#               nc_loc_id,
   --#               nonce_rem,
   --#               initiator,
   --#               esp_spi_loc,
   --#               esp_spi_rem;

   procedure Esa_Create_First
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type);
   --  Creates the first ESP SA for an AE.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               esa_id,
   --#               isa_id,
   --#               sp_id,
   --#               ea_id,
   --#               esp_spi_loc,
   --#               esp_spi_rem;

   procedure Esa_Select
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type);
   --  Selects an ESA context for outgoing traffic.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               esa_id;

end Tkmrpc.Servers.Ike;
