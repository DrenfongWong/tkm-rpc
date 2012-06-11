package body TKMRPC.Servers.IKE
is

   -------------------------------------------------------------------------

   procedure ae_reset
     (Result : out Results.Result_Type;
      ae_id : Types.ae_id_type)
   is
      pragma Unreferenced (ae_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end ae_reset;

   -------------------------------------------------------------------------

   procedure cc_add_certificate
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type)
   is
      pragma Unreferenced (cc_id);
      pragma Unreferenced (autha_id);
      pragma Unreferenced (certificate);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end cc_add_certificate;

   -------------------------------------------------------------------------

   procedure cc_check_ca
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type)
   is
      pragma Unreferenced (cc_id);
      pragma Unreferenced (ca_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end cc_check_ca;

   -------------------------------------------------------------------------

   procedure cc_reset
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type)
   is
      pragma Unreferenced (cc_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end cc_reset;

   -------------------------------------------------------------------------

   procedure cc_set_user_certificate
     (Result : out Results.Result_Type;
      cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type)
   is
      pragma Unreferenced (cc_id);
      pragma Unreferenced (ri_id);
      pragma Unreferenced (autha_id);
      pragma Unreferenced (certificate);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end cc_set_user_certificate;

   -------------------------------------------------------------------------

   procedure dh_create
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type)
   is
      pragma Unreferenced (dh_id);
      pragma Unreferenced (dha_id);
      pragma Unreferenced (pubvalue);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end dh_create;

   -------------------------------------------------------------------------

   procedure dh_generate_key
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type)
   is
      pragma Unreferenced (dh_id);
      pragma Unreferenced (pubvalue);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end dh_generate_key;

   -------------------------------------------------------------------------

   procedure dh_reset
     (Result : out Results.Result_Type;
      dh_id : Types.dh_id_type)
   is
      pragma Unreferenced (dh_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end dh_reset;

   -------------------------------------------------------------------------

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
      esp_spi_rem : Types.esp_spi_type)
   is
      pragma Unreferenced (esa_id);
      pragma Unreferenced (isa_id);
      pragma Unreferenced (sp_id);
      pragma Unreferenced (ea_id);
      pragma Unreferenced (dh_id);
      pragma Unreferenced (nc_loc_id);
      pragma Unreferenced (nonce_rem);
      pragma Unreferenced (initiator);
      pragma Unreferenced (esp_spi_loc);
      pragma Unreferenced (esp_spi_rem);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end esa_create;

   -------------------------------------------------------------------------

   procedure esa_create_first
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type)
   is
      pragma Unreferenced (esa_id);
      pragma Unreferenced (isa_id);
      pragma Unreferenced (sp_id);
      pragma Unreferenced (ea_id);
      pragma Unreferenced (esp_spi_loc);
      pragma Unreferenced (esp_spi_rem);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end esa_create_first;

   -------------------------------------------------------------------------

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
      esp_spi_rem : Types.esp_spi_type)
   is
      pragma Unreferenced (esa_id);
      pragma Unreferenced (isa_id);
      pragma Unreferenced (sp_id);
      pragma Unreferenced (ea_id);
      pragma Unreferenced (nc_loc_id);
      pragma Unreferenced (nonce_rem);
      pragma Unreferenced (initiator);
      pragma Unreferenced (esp_spi_loc);
      pragma Unreferenced (esp_spi_rem);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end esa_create_no_pfs;

   -------------------------------------------------------------------------

   procedure esa_reset
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type)
   is
      pragma Unreferenced (esa_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end esa_reset;

   -------------------------------------------------------------------------

   procedure esa_select
     (Result : out Results.Result_Type;
      esa_id : Types.esa_id_type)
   is
      pragma Unreferenced (esa_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end esa_select;

   -------------------------------------------------------------------------

   procedure isa_auth
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type)
   is
      pragma Unreferenced (isa_id);
      pragma Unreferenced (cc_id);
      pragma Unreferenced (init_message);
      pragma Unreferenced (signature);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end isa_auth;

   -------------------------------------------------------------------------

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
      sk_er : out Types.key_type)
   is
      pragma Unreferenced (isa_id);
      pragma Unreferenced (ae_id);
      pragma Unreferenced (ia_id);
      pragma Unreferenced (dh_id);
      pragma Unreferenced (nc_loc_id);
      pragma Unreferenced (nonce_rem);
      pragma Unreferenced (initiator);
      pragma Unreferenced (spi_loc);
      pragma Unreferenced (spi_rem);
      pragma Unreferenced (sk_ai);
      pragma Unreferenced (sk_ar);
      pragma Unreferenced (sk_ei);
      pragma Unreferenced (sk_er);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end isa_create;

   -------------------------------------------------------------------------

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
      sk_er : out Types.key_type)
   is
      pragma Unreferenced (isa_id);
      pragma Unreferenced (parent_isa_id);
      pragma Unreferenced (ia_id);
      pragma Unreferenced (dh_id);
      pragma Unreferenced (nc_loc_id);
      pragma Unreferenced (nonce_rem);
      pragma Unreferenced (initiator);
      pragma Unreferenced (spi_loc);
      pragma Unreferenced (spi_rem);
      pragma Unreferenced (sk_ai);
      pragma Unreferenced (sk_ar);
      pragma Unreferenced (sk_ei);
      pragma Unreferenced (sk_er);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end isa_create_child;

   -------------------------------------------------------------------------

   procedure isa_reset
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type)
   is
      pragma Unreferenced (isa_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end isa_reset;

   -------------------------------------------------------------------------

   procedure isa_sign
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type)
   is
      pragma Unreferenced (isa_id);
      pragma Unreferenced (lc_id);
      pragma Unreferenced (init_message);
      pragma Unreferenced (signature);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end isa_sign;

   -------------------------------------------------------------------------

   procedure isa_skip_create_first
     (Result : out Results.Result_Type;
      isa_id : Types.isa_id_type)
   is
      pragma Unreferenced (isa_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end isa_skip_create_first;

   -------------------------------------------------------------------------

   procedure nc_create
     (Result : out Results.Result_Type;
      nc_id : Types.nc_id_type;
      nonce_length : Types.nonce_length_type;
      nonce : out Types.nonce_type)
   is
      pragma Unreferenced (nc_id);
      pragma Unreferenced (nonce_length);
      pragma Unreferenced (nonce);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end nc_create;

   -------------------------------------------------------------------------

   procedure nc_reset
     (Result : out Results.Result_Type;
      nc_id : Types.nc_id_type)
   is
      pragma Unreferenced (nc_id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end nc_reset;

   -------------------------------------------------------------------------

   procedure tkm_limits
     (Result : out Results.Result_Type;
      max_active_requests : out Types.active_requests_type;
      nc_contexts : out Types.nc_id_type;
      dh_contexts : out Types.dh_id_type;
      cc_contexts : out Types.cc_id_type;
      ae_contexts : out Types.ae_id_type;
      isa_contexts : out Types.isa_id_type;
      esa_contexts : out Types.esa_id_type)
   is
      pragma Unreferenced (max_active_requests);
      pragma Unreferenced (nc_contexts);
      pragma Unreferenced (dh_contexts);
      pragma Unreferenced (cc_contexts);
      pragma Unreferenced (ae_contexts);
      pragma Unreferenced (isa_contexts);
      pragma Unreferenced (esa_contexts);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end tkm_limits;

   -------------------------------------------------------------------------

   procedure tkm_version
     (Result : out Results.Result_Type;
      version : out Types.version_type)
   is
      pragma Unreferenced (version);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end tkm_version;

end TKMRPC.Servers.IKE;
