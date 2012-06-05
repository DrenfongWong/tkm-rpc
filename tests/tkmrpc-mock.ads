with TKMRPC.Types;
with TKMRPC.Servers.IKE;
with TKMRPC.Results;

package TKMRPC.Mock
is
   type TKM_Type is new Servers.IKE.IKE_Interface with private;
   --  TKM implementation mock.

   overriding
   procedure tkm_version
     (Object : TKM_Type;
      version : out Types.version_type;
      Result : out Results.Result_Type)
   is null;

   overriding
   procedure tkm_limits
     (Object : TKM_Type;
      max_active_requests : out Types.active_requests_type;
      nc_contexts : out Types.nc_id_type;
      dh_contexts : out Types.dh_id_type;
      cc_contexts : out Types.cc_id_type;
      ae_contexts : out Types.ae_id_type;
      isa_contexts : out Types.isa_id_type;
      esa_contexts : out Types.esa_id_type;
      Result : out Results.Result_Type)
   is null;

   overriding
   procedure nc_reset
     (Object : TKM_Type;
      nc_id : Types.nc_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Reset a NC context. Not implemented yet.

   overriding
   procedure nc_create
     (Object       :     TKM_Type;
      Nonce_Id     :     Types.nc_id_type;
      Nonce_Length :     Types.nonce_length_type;
      Nonce        : out Types.nonce_type;
      Result       : out Results.Result_Type);
   --  Create a new nonce.

   overriding
   procedure dh_reset
     (Object : TKM_Type;
      dh_id : Types.dh_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Reset a DH context.

   overriding
   procedure dh_create
     (Object : TKM_Type;
      dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
   is null;
   --  Create a DH secret and return its public value.

   overriding
   procedure dh_generate_key
     (Object : TKM_Type;
      dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
   is null;
   --  Create a nonce.

   overriding
   procedure cc_reset
     (Object : TKM_Type;
      cc_id : Types.cc_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Reset a CC context.

   overriding
   procedure cc_set_user_certificate
     (Object : TKM_Type;
      cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
   is null;
   --  Initiates a certificate chain starting from the user certificate.

   overriding
   procedure cc_add_certificate
     (Object : TKM_Type;
      cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
   is null;
   --  Add a certificate to a certificate chain.

   overriding
   procedure cc_check_ca
     (Object : TKM_Type;
      cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Checks if a cc is based on a trusted CA

   overriding
   procedure ae_reset
     (Object : TKM_Type;
      ae_id : Types.ae_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Reset an AE context.

   overriding
   procedure isa_reset
     (Object : TKM_Type;
      isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Reset an ISA context.

   overriding
   procedure isa_create
     (Object : TKM_Type;
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
      sk_er : out Types.key_type;
      Result : out Results.Result_Type)
   is null;
   --  Create an IKE SA context.

   overriding
   procedure isa_sign
     (Object : TKM_Type;
      isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type;
      Result : out Results.Result_Type)
   is null;
   --  Provide authentication to the remote endpoint.

   overriding
   procedure isa_auth
     (Object : TKM_Type;
      isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type;
      Result : out Results.Result_Type)
   is null;
   --  Authenticate the remote endpoint.

   overriding
   procedure isa_create_child
     (Object : TKM_Type;
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
      sk_er : out Types.key_type;
      Result : out Results.Result_Type)
   is null;
   --  Derive an IKE SA context from an existing SA.

   overriding
   procedure isa_skip_create_first
     (Object : TKM_Type;
      isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Don't create a first child.

   overriding
   procedure esa_reset
     (Object : TKM_Type;
      esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Reset an ESA context.

   overriding
   procedure esa_create
     (Object : TKM_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      dh_id : Types.dh_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type;
      Result : out Results.Result_Type)
   is null;
   --  Creates an ESP SA.

   overriding
   procedure esa_create_no_pfs
     (Object : TKM_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type;
      Result : out Results.Result_Type)
   is null;
   --  Creates an ESP SA without PFS.

   overriding
   procedure esa_create_first
     (Object : TKM_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type;
      Result : out Results.Result_Type)
   is null;
   --  Creates the first ESP SA for an AE.

   overriding
   procedure esa_select
     (Object : TKM_Type;
      esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
   is null;
   --  Selects an ESA context for outgoing traffic.

   Ref_Nonce : constant Types.nonce_type
     := (Size => 156,
         Data => (others => Character'Pos ('f')));
   --  Reference nonce returned by Nc_Create function.

   Last_Nonce_Id     : Types.nc_id_type        := 0;
   Last_Nonce_Length : Types.nonce_length_type := 16;
   --  Calls to Nc_Create will set these vars to the last requested nonce Id
   --  and length.

private

   type TKM_Type is new Servers.IKE.IKE_Interface with null record;

end TKMRPC.Mock;
