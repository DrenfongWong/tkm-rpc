with TKMRPC.Types;
with TKMRPC.Results;

package TKMRPC.Servers.IKE
is

   type IKE_Interface is interface;
   --  The TKM - IKE interface

   type IKE_Handle is access all IKE_Interface'Class;

   procedure tkm_version
     (Object : IKE_Interface;
      version : out Types.version_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Returns the version of TKM.

   procedure tkm_limits
     (Object : IKE_Interface;
      max_active_requests : out Types.active_requests_type;
      nc_contexts : out Types.nc_id_type;
      dh_contexts : out Types.dh_id_type;
      cc_contexts : out Types.cc_id_type;
      ae_contexts : out Types.ae_id_type;
      isa_contexts : out Types.isa_id_type;
      esa_contexts : out Types.esa_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Returns limits of fixed length of TKM.

   procedure nc_reset
     (Object : IKE_Interface;
      nc_id : Types.nc_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Reset a NC context.

   procedure nc_create
     (Object : IKE_Interface;
      nc_id : Types.nc_id_type;
      nonce_length : Types.nonce_length_type;
      nonce : out Types.nonce_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Create a nonce.

   procedure dh_reset
     (Object : IKE_Interface;
      dh_id : Types.dh_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Reset a DH context.

   procedure dh_create
     (Object : IKE_Interface;
      dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Create a DH secret and return its public value.

   procedure dh_generate_key
     (Object : IKE_Interface;
      dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Create a nonce.

   procedure cc_reset
     (Object : IKE_Interface;
      cc_id : Types.cc_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Reset a CC context.

   procedure cc_set_user_certificate
     (Object : IKE_Interface;
      cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Initiates a certificate chain starting from the user certificate.

   procedure cc_add_certificate
     (Object : IKE_Interface;
      cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Add a certificate to a certificate chain.

   procedure cc_check_ca
     (Object : IKE_Interface;
      cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Checks if a cc is based on a trusted CA

   procedure ae_reset
     (Object : IKE_Interface;
      ae_id : Types.ae_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Reset an AE context.

   procedure isa_reset
     (Object : IKE_Interface;
      isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Reset an ISA context.

   procedure isa_create
     (Object : IKE_Interface;
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
      is abstract;
   --  Create an IKE SA context.

   procedure isa_sign
     (Object : IKE_Interface;
      isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Provide authentication to the remote endpoint.

   procedure isa_auth
     (Object : IKE_Interface;
      isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Authenticate the remote endpoint.

   procedure isa_create_child
     (Object : IKE_Interface;
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
      is abstract;
   --  Derive an IKE SA context from an existing SA.

   procedure isa_skip_create_first
     (Object : IKE_Interface;
      isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Don't create a first child.

   procedure esa_reset
     (Object : IKE_Interface;
      esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Reset an ESA context.

   procedure esa_create
     (Object : IKE_Interface;
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
      is abstract;
   --  Creates an ESP SA.

   procedure esa_create_no_pfs
     (Object : IKE_Interface;
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
      is abstract;
   --  Creates an ESP SA without PFS.

   procedure esa_create_first
     (Object : IKE_Interface;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Creates the first ESP SA for an AE.

   procedure esa_select
     (Object : IKE_Interface;
      esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
      is abstract;
   --  Selects an ESA context for outgoing traffic.

   --------------
   -- Registry --
   --------------

   procedure Register (Object : IKE_Handle);
   --  Register IKE implementation instance.

   procedure Unregister;
   --  Unregister current IKE implementation;

   function Get_Instance return IKE_Handle;
   --  Return registered TKM IKE implementation instance.

end TKMRPC.Servers.IKE;
