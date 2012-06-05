with TKMRPC.Operations.IKE;
with TKMRPC.Transport.Client;
with TKMRPC.Request.IKE.nc_create.Convert;
with TKMRPC.Response.IKE.nc_create.Convert;

package body TKMRPC.Clients.IKE
is

   -------------------------------------------------------------------------

   procedure Init (Result : out Results.Result_Type)
   is
   begin
      Transport.Client.Connect (Address => Communication_Socket);
      Result := Results.OK;

   exception
      when others =>
         Result := Results.Invalid_Operation;
   end Init;

   -------------------------------------------------------------------------

   procedure tkm_version
     (version : out Types.version_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end tkm_version;

   -------------------------------------------------------------------------

   procedure tkm_limits
     (max_active_requests : out Types.active_requests_type;
      nc_contexts : out Types.nc_id_type;
      dh_contexts : out Types.dh_id_type;
      cc_contexts : out Types.cc_id_type;
      ae_contexts : out Types.ae_id_type;
      isa_contexts : out Types.isa_id_type;
      esa_contexts : out Types.esa_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end tkm_limits;

   -------------------------------------------------------------------------

   procedure nc_reset
     (nc_id : Types.nc_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end nc_reset;

   -------------------------------------------------------------------------

   procedure nc_create
     (nc_id : Types.nc_id_type;
      nonce_length : Types.nonce_length_type;
      nonce : out Types.nonce_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req : Request.IKE.nc_create.Request_Type;
   begin
      Req.Header.Operation  := Operations.IKE.nc_create;
      Req.Data.nc_id        := nc_id;
      Req.Data.nonce_length := nonce_length;

      Transport.Client.Send
        (Data => Request.IKE.nc_create.Convert.To_Request (S => Req));

      declare
         Data : Response.Data_Type;
         Res  : Response.IKE.nc_create.Response_Type;
      begin
         Transport.Client.Receive (Data => Data);
         Res := Response.IKE.nc_create.Convert.From_Response (S => Data);

         nonce.Size := Res.Data.nonce.Size;
         nonce.Data := Res.Data.nonce.Data;
         Result     := Res.Header.Result;
      end;
   end nc_create;

   -------------------------------------------------------------------------

   procedure dh_reset
     (dh_id : Types.dh_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end dh_reset;

   -------------------------------------------------------------------------

   procedure dh_create
     (dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end dh_create;

   -------------------------------------------------------------------------

   procedure dh_generate_key
     (dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end dh_generate_key;

   -------------------------------------------------------------------------

   procedure cc_reset
     (cc_id : Types.cc_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end cc_reset;

   -------------------------------------------------------------------------

   procedure cc_set_user_certificate
     (cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end cc_set_user_certificate;

   -------------------------------------------------------------------------

   procedure cc_add_certificate
     (cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end cc_add_certificate;

   -------------------------------------------------------------------------

   procedure cc_check_ca
     (cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end cc_check_ca;

   -------------------------------------------------------------------------

   procedure ae_reset
     (ae_id : Types.ae_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end ae_reset;

   -------------------------------------------------------------------------

   procedure isa_reset
     (isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end isa_reset;

   -------------------------------------------------------------------------

   procedure isa_create
     (isa_id : Types.isa_id_type;
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
   is
   begin

      --  Auto-generated stub.

      null;
   end isa_create;

   -------------------------------------------------------------------------

   procedure isa_sign
     (isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end isa_sign;

   -------------------------------------------------------------------------

   procedure isa_auth
     (isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end isa_auth;

   -------------------------------------------------------------------------

   procedure isa_create_child
     (isa_id : Types.isa_id_type;
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
   is
   begin

      --  Auto-generated stub.

      null;
   end isa_create_child;

   -------------------------------------------------------------------------

   procedure isa_skip_create_first
     (isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end isa_skip_create_first;

   -------------------------------------------------------------------------

   procedure esa_reset
     (esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end esa_reset;

   -------------------------------------------------------------------------

   procedure esa_create
     (esa_id : Types.esa_id_type;
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
   is
   begin

      --  Auto-generated stub.

      null;
   end esa_create;

   -------------------------------------------------------------------------

   procedure esa_create_no_pfs
     (esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end esa_create_no_pfs;

   -------------------------------------------------------------------------

   procedure esa_create_first
     (esa_id : Types.esa_id_type;
      isa_id : Types.isa_id_type;
      sp_id : Types.sp_id_type;
      ea_id : Types.ea_id_type;
      esp_spi_loc : Types.esp_spi_type;
      esp_spi_rem : Types.esp_spi_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end esa_create_first;

   -------------------------------------------------------------------------

   procedure esa_select
     (esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      null;
   end esa_select;

end TKMRPC.Clients.IKE;
