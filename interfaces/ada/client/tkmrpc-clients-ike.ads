with Interfaces.C.Strings;

with TKMRPC.Types;
with TKMRPC.Results;

package TKMRPC.Clients.IKE
is

   procedure Init
     (Result  : out Results.Result_Type;
      Address :     Interfaces.C.Strings.chars_ptr);
   pragma Export (C, Init, "ike_init");
   pragma Export_Valued_Procedure (Init);
   --  Initialize IKE client with given address.

   procedure tkm_version
     (Result : out Results.Result_Type;
      version : out Types.version_type);
   pragma Export (C, tkm_version, "ike_tkm_version");
   pragma Export_Valued_Procedure (tkm_version);
   --  Returns the version of TKM.

   procedure tkm_limits
     (Result : out Results.Result_Type;
      max_active_requests : out Types.active_requests_type;
      nc_contexts : out Types.nc_id_type;
      dh_contexts : out Types.dh_id_type;
      cc_contexts : out Types.cc_id_type;
      ae_contexts : out Types.ae_id_type;
      isa_contexts : out Types.isa_id_type;
      esa_contexts : out Types.esa_id_type);
   pragma Export (C, tkm_limits, "ike_tkm_limits");
   pragma Export_Valued_Procedure (tkm_limits);
   --  Returns limits of fixed length of TKM.

   procedure nc_reset
     (Result : out Results.Result_Type;
      nc_id : Types.nc_id_type);
   pragma Export (C, nc_reset, "ike_nc_reset");
   pragma Export_Valued_Procedure (nc_reset);
   --  Reset a NC context.

   procedure nc_create
     (Result : out Results.Result_Type;
      nc_id : Types.nc_id_type;
      nonce_length : Types.nonce_length_type;
      nonce : out Types.nonce_type);
   pragma Export (C, nc_create, "ike_nc_create");
   pragma Export_Valued_Procedure (nc_create);
   --  Create a nonce.

   procedure dh_reset
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type);
   pragma Export (C, dh_reset, "ike_dh_reset");
   pragma Export_Valued_Procedure (dh_reset);
   --  Reset a DH context.

   procedure dh_create
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type);
   pragma Export (C, dh_create, "ike_dh_create");
   pragma Export_Valued_Procedure (dh_create);
   --  Create a DH secret and return its public value.

   procedure dh_generate_key
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type);
   pragma Export (C, dh_generate_key, "ike_dh_generate_key");
   pragma Export_Valued_Procedure (dh_generate_key);
   --  Create a nonce.

   procedure cc_reset
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type);
   pragma Export (C, cc_reset, "ike_cc_reset");
   pragma Export_Valued_Procedure (cc_reset);
   --  Reset a CC context.

   procedure cc_set_user_certificate
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type);
   pragma Export (C, cc_set_user_certificate, "ike_cc_set_user_certificate");
   pragma Export_Valued_Procedure (cc_set_user_certificate);
   --  Initiates a certificate chain starting from the user certificate.

   procedure cc_add_certificate
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type);
   pragma Export (C, cc_add_certificate, "ike_cc_add_certificate");
   pragma Export_Valued_Procedure (cc_add_certificate);
   --  Add a certificate to a certificate chain.

   procedure cc_check_ca
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type);
   pragma Export (C, cc_check_ca, "ike_cc_check_ca");
   pragma Export_Valued_Procedure (cc_check_ca);
   --  Checks if a cc is based on a trusted CA

   procedure ae_reset
     (Result : out Results.Result_Type;
      ae_id : Types.ae_id_type);
   pragma Export (C, ae_reset, "ike_ae_reset");
   pragma Export_Valued_Procedure (ae_reset);
   --  Reset an AE context.

   procedure isa_reset
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type);
   pragma Export (C, isa_reset, "ike_isa_reset");
   pragma Export_Valued_Procedure (isa_reset);
   --  Reset an ISA context.

   procedure isa_create
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      dh_id : Types.dh_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      spi_loc : Types.ike_spi_type;
      spi_rem : Types.ike_spi_type;
      sk_ai : out Types.key_type;
      sk_ar : out Types.key_type;
      sk_ei : out Types.key_type;
      sk_er : out Types.key_type);
   pragma Export (C, isa_create, "ike_isa_create");
   pragma Export_Valued_Procedure (isa_create);
   --  Create an IKE SA context.

   procedure isa_sign
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type);
   pragma Export (C, isa_sign, "ike_isa_sign");
   pragma Export_Valued_Procedure (isa_sign);
   --  Provide authentication to the remote endpoint.

   procedure isa_auth
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type);
   pragma Export (C, isa_auth, "ike_isa_auth");
   pragma Export_Valued_Procedure (isa_auth);
   --  Authenticate the remote endpoint.

   procedure isa_create_child
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      parent_isa_id : Types.isa_id_type;
      ia_id : Types.ia_id_type;
      dh_id : Types.dh_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      spi_loc : Types.ike_spi_type;
      spi_rem : Types.ike_spi_type;
      sk_ai : out Types.key_type;
      sk_ar : out Types.key_type;
      sk_ei : out Types.key_type;
      sk_er : out Types.key_type);
   pragma Export (C, isa_create_child, "ike_isa_create_child");
   pragma Export_Valued_Procedure (isa_create_child);
   --  Derive an IKE SA context from an existing SA.

   procedure isa_skip_create_first
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type);
   pragma Export (C, isa_skip_create_first, "ike_isa_skip_create_first");
   pragma Export_Valued_Procedure (isa_skip_create_first);
   --  Don't create a first child.

   procedure esa_reset
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type);
   pragma Export (C, esa_reset, "ike_esa_reset");
   pragma Export_Valued_Procedure (esa_reset);
   --  Reset an ESA context.

   procedure esa_create
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      dh_id : Types.dh_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type);
   pragma Export (C, esa_create, "ike_esa_create");
   pragma Export_Valued_Procedure (esa_create);
   --  Creates an ESP SA.

   procedure esa_create_no_pfs
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type);
   pragma Export (C, esa_create_no_pfs, "ike_esa_create_no_pfs");
   pragma Export_Valued_Procedure (esa_create_no_pfs);
   --  Creates an ESP SA without PFS.

   procedure esa_create_first
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type);
   pragma Export (C, esa_create_first, "ike_esa_create_first");
   pragma Export_Valued_Procedure (esa_create_first);
   --  Creates the first ESP SA for an AE.

   procedure esa_select
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type);
   pragma Export (C, esa_select, "ike_esa_select");
   pragma Export_Valued_Procedure (esa_select);
   --  Selects an ESA context for outgoing traffic.

end TKMRPC.Clients.IKE;
