with TKMRPC.Types;
with TKMRPC.Results;

package TKMRPC.Servers.IKE
is

   procedure tkm_version
     (Result : out Results.Result_Type;
      version : out Types.version_type);
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
   --  Returns limits of fixed length of TKM.

   procedure nc_reset
     (Result : out Results.Result_Type;
      nc_id : Types.nc_id_type);
   --  Reset a NC context.

   procedure nc_create
     (Result : out Results.Result_Type;
      nc_id : Types.nc_id_type;
      nonce_length : Types.nonce_length_type;
      nonce : out Types.nonce_type);
   --  Create a nonce.

   procedure dh_reset
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type);
   --  Reset a DH context.

   procedure dh_create
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type);
   --  Create a DH secret and return its public value.

   procedure dh_generate_key
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type);
   --  Create a nonce.

   procedure cc_reset
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type);
   --  Reset a CC context.

   procedure cc_set_user_certificate
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type);
   --  Initiates a certificate chain starting from the user certificate.

   procedure cc_add_certificate
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type);
   --  Add a certificate to a certificate chain.

   procedure cc_check_ca
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type);
   --  Checks if a cc is based on a trusted CA

   procedure ae_reset
     (Result : out Results.Result_Type;
      ae_id : Types.ae_id_type);
   --  Reset an AE context.

   procedure isa_reset
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type);
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
   --  Create an IKE SA context.

   procedure isa_sign
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type);
   --  Provide authentication to the remote endpoint.

   procedure isa_auth
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type);
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
   --  Derive an IKE SA context from an existing SA.

   procedure isa_skip_create_first
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type);
   --  Don't create a first child.

   procedure esa_reset
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type);
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
   --  Creates an ESP SA without PFS.

   procedure esa_create_first
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type);
   --  Creates the first ESP SA for an AE.

   procedure esa_select
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type);
   --  Selects an ESA context for outgoing traffic.

end TKMRPC.Servers.IKE;
