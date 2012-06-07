with TKMRPC.Transport.Client;
with TKMRPC.Operations.IKE;
with TKMRPC.Request.IKE.tkm_version.Convert;
with TKMRPC.Request.IKE.tkm_limits.Convert;
with TKMRPC.Request.IKE.nc_reset.Convert;
with TKMRPC.Request.IKE.nc_create.Convert;
with TKMRPC.Request.IKE.dh_reset.Convert;
with TKMRPC.Request.IKE.dh_create.Convert;
with TKMRPC.Request.IKE.dh_generate_key.Convert;
with TKMRPC.Request.IKE.cc_reset.Convert;
with TKMRPC.Request.IKE.cc_set_user_certificate.Convert;
with TKMRPC.Request.IKE.cc_add_certificate.Convert;
with TKMRPC.Request.IKE.cc_check_ca.Convert;
with TKMRPC.Request.IKE.ae_reset.Convert;
with TKMRPC.Request.IKE.isa_reset.Convert;
with TKMRPC.Request.IKE.isa_create.Convert;
with TKMRPC.Request.IKE.isa_sign.Convert;
with TKMRPC.Request.IKE.isa_auth.Convert;
with TKMRPC.Request.IKE.isa_create_child.Convert;
with TKMRPC.Request.IKE.isa_skip_create_first.Convert;
with TKMRPC.Request.IKE.esa_reset.Convert;
with TKMRPC.Request.IKE.esa_create.Convert;
with TKMRPC.Request.IKE.esa_create_no_pfs.Convert;
with TKMRPC.Request.IKE.esa_create_first.Convert;
with TKMRPC.Request.IKE.esa_select.Convert;
with TKMRPC.Response.IKE.tkm_version.Convert;
with TKMRPC.Response.IKE.tkm_limits.Convert;
with TKMRPC.Response.IKE.nc_reset.Convert;
with TKMRPC.Response.IKE.nc_create.Convert;
with TKMRPC.Response.IKE.dh_reset.Convert;
with TKMRPC.Response.IKE.dh_create.Convert;
with TKMRPC.Response.IKE.dh_generate_key.Convert;
with TKMRPC.Response.IKE.cc_reset.Convert;
with TKMRPC.Response.IKE.cc_set_user_certificate.Convert;
with TKMRPC.Response.IKE.cc_add_certificate.Convert;
with TKMRPC.Response.IKE.cc_check_ca.Convert;
with TKMRPC.Response.IKE.ae_reset.Convert;
with TKMRPC.Response.IKE.isa_reset.Convert;
with TKMRPC.Response.IKE.isa_create.Convert;
with TKMRPC.Response.IKE.isa_sign.Convert;
with TKMRPC.Response.IKE.isa_auth.Convert;
with TKMRPC.Response.IKE.isa_create_child.Convert;
with TKMRPC.Response.IKE.isa_skip_create_first.Convert;
with TKMRPC.Response.IKE.esa_reset.Convert;
with TKMRPC.Response.IKE.esa_create.Convert;
with TKMRPC.Response.IKE.esa_create_no_pfs.Convert;
with TKMRPC.Response.IKE.esa_create_first.Convert;
with TKMRPC.Response.IKE.esa_select.Convert;

package body TKMRPC.Clients.IKE
is

   -------------------------------------------------------------------------

   procedure Init
     (Result  : out Results.Result_Type;
      Address :     Interfaces.C.Strings.chars_ptr) is separate;

   -------------------------------------------------------------------------

   procedure ae_reset
     (ae_id : Types.ae_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.ae_reset.Request_Type;
      Res  : Response.IKE.ae_reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.ae_reset;
      Req.Data.ae_id := ae_id;

      Transport.Client.Send
        (Data => Request.IKE.ae_reset.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.ae_reset.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end ae_reset;

   -------------------------------------------------------------------------

   procedure cc_add_certificate
     (cc_id : Types.cc_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.cc_add_certificate.Request_Type;
      Res  : Response.IKE.cc_add_certificate.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.cc_add_certificate;
      Req.Data.cc_id := cc_id;
      Req.Data.autha_id := autha_id;
      Req.Data.certificate := certificate;

      Transport.Client.Send
        (Data => Request.IKE.cc_add_certificate.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.cc_add_certificate.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end cc_add_certificate;

   -------------------------------------------------------------------------

   procedure cc_check_ca
     (cc_id : Types.cc_id_type;
      ca_id : Types.ca_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.cc_check_ca.Request_Type;
      Res  : Response.IKE.cc_check_ca.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.cc_check_ca;
      Req.Data.cc_id := cc_id;
      Req.Data.ca_id := ca_id;

      Transport.Client.Send
        (Data => Request.IKE.cc_check_ca.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.cc_check_ca.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end cc_check_ca;

   -------------------------------------------------------------------------

   procedure cc_reset
     (cc_id : Types.cc_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.cc_reset.Request_Type;
      Res  : Response.IKE.cc_reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.cc_reset;
      Req.Data.cc_id := cc_id;

      Transport.Client.Send
        (Data => Request.IKE.cc_reset.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.cc_reset.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end cc_reset;

   -------------------------------------------------------------------------

   procedure cc_set_user_certificate
     (cc_id : Types.cc_id_type;
      ri_id : Types.ri_id_type;
      autha_id : Types.autha_id_type;
      certificate : Types.certificate_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.cc_set_user_certificate.Request_Type;
      Res  : Response.IKE.cc_set_user_certificate.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.cc_set_user_certificate;
      Req.Data.cc_id := cc_id;
      Req.Data.ri_id := ri_id;
      Req.Data.autha_id := autha_id;
      Req.Data.certificate := certificate;

      Transport.Client.Send
        (Data => Request.IKE.cc_set_user_certificate.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.cc_set_user_certificate.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end cc_set_user_certificate;

   -------------------------------------------------------------------------

   procedure dh_create
     (dh_id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      pubvalue : out Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.dh_create.Request_Type;
      Res  : Response.IKE.dh_create.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.dh_create;
      Req.Data.dh_id := dh_id;
      Req.Data.dha_id := dha_id;

      Transport.Client.Send
        (Data => Request.IKE.dh_create.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.dh_create.Convert.From_Response
        (S => Data);

      pubvalue := Res.Data.pubvalue;
      Result := Res.Header.Result;
   end dh_create;

   -------------------------------------------------------------------------

   procedure dh_generate_key
     (dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.dh_generate_key.Request_Type;
      Res  : Response.IKE.dh_generate_key.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.dh_generate_key;
      Req.Data.dh_id := dh_id;
      Req.Data.pubvalue := pubvalue;

      Transport.Client.Send
        (Data => Request.IKE.dh_generate_key.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.dh_generate_key.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end dh_generate_key;

   -------------------------------------------------------------------------

   procedure dh_reset
     (dh_id : Types.dh_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.dh_reset.Request_Type;
      Res  : Response.IKE.dh_reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.dh_reset;
      Req.Data.dh_id := dh_id;

      Transport.Client.Send
        (Data => Request.IKE.dh_reset.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.dh_reset.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end dh_reset;

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
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.esa_create.Request_Type;
      Res  : Response.IKE.esa_create.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.esa_create;
      Req.Data.esa_id := esa_id;
      Req.Data.isa_id := isa_id;
      Req.Data.sp_id := sp_id;
      Req.Data.ea_id := ea_id;
      Req.Data.dh_id := dh_id;
      Req.Data.nc_loc_id := nc_loc_id;
      Req.Data.nonce_rem := nonce_rem;
      Req.Data.initiator := initiator;
      Req.Data.esp_spi_loc := esp_spi_loc;
      Req.Data.esp_spi_rem := esp_spi_rem;

      Transport.Client.Send
        (Data => Request.IKE.esa_create.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.esa_create.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end esa_create;

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
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.esa_create_first.Request_Type;
      Res  : Response.IKE.esa_create_first.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.esa_create_first;
      Req.Data.esa_id := esa_id;
      Req.Data.isa_id := isa_id;
      Req.Data.sp_id := sp_id;
      Req.Data.ea_id := ea_id;
      Req.Data.esp_spi_loc := esp_spi_loc;
      Req.Data.esp_spi_rem := esp_spi_rem;

      Transport.Client.Send
        (Data => Request.IKE.esa_create_first.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.esa_create_first.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end esa_create_first;

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
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.esa_create_no_pfs.Request_Type;
      Res  : Response.IKE.esa_create_no_pfs.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.esa_create_no_pfs;
      Req.Data.esa_id := esa_id;
      Req.Data.isa_id := isa_id;
      Req.Data.sp_id := sp_id;
      Req.Data.ea_id := ea_id;
      Req.Data.nc_loc_id := nc_loc_id;
      Req.Data.nonce_rem := nonce_rem;
      Req.Data.initiator := initiator;
      Req.Data.esp_spi_loc := esp_spi_loc;
      Req.Data.esp_spi_rem := esp_spi_rem;

      Transport.Client.Send
        (Data => Request.IKE.esa_create_no_pfs.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.esa_create_no_pfs.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end esa_create_no_pfs;

   -------------------------------------------------------------------------

   procedure esa_reset
     (esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.esa_reset.Request_Type;
      Res  : Response.IKE.esa_reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.esa_reset;
      Req.Data.esa_id := esa_id;

      Transport.Client.Send
        (Data => Request.IKE.esa_reset.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.esa_reset.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end esa_reset;

   -------------------------------------------------------------------------

   procedure esa_select
     (esa_id : Types.esa_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.esa_select.Request_Type;
      Res  : Response.IKE.esa_select.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.esa_select;
      Req.Data.esa_id := esa_id;

      Transport.Client.Send
        (Data => Request.IKE.esa_select.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.esa_select.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end esa_select;

   -------------------------------------------------------------------------

   procedure isa_auth
     (isa_id : Types.isa_id_type;
      cc_id : Types.cc_id_type;
      init_message : Types.init_message_type;
      signature : Types.signature_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.isa_auth.Request_Type;
      Res  : Response.IKE.isa_auth.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.isa_auth;
      Req.Data.isa_id := isa_id;
      Req.Data.cc_id := cc_id;
      Req.Data.init_message := init_message;
      Req.Data.signature := signature;

      Transport.Client.Send
        (Data => Request.IKE.isa_auth.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.isa_auth.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end isa_auth;

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
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.isa_create.Request_Type;
      Res  : Response.IKE.isa_create.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.isa_create;
      Req.Data.isa_id := isa_id;
      Req.Data.ae_id := ae_id;
      Req.Data.ia_id := ia_id;
      Req.Data.dh_id := dh_id;
      Req.Data.nc_loc_id := nc_loc_id;
      Req.Data.nonce_rem := nonce_rem;
      Req.Data.initiator := initiator;
      Req.Data.spi_loc := spi_loc;
      Req.Data.spi_rem := spi_rem;

      Transport.Client.Send
        (Data => Request.IKE.isa_create.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.isa_create.Convert.From_Response
        (S => Data);

      sk_ai := Res.Data.sk_ai;
      sk_ar := Res.Data.sk_ar;
      sk_ei := Res.Data.sk_ei;
      sk_er := Res.Data.sk_er;
      Result := Res.Header.Result;
   end isa_create;

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
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.isa_create_child.Request_Type;
      Res  : Response.IKE.isa_create_child.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.isa_create_child;
      Req.Data.isa_id := isa_id;
      Req.Data.parent_isa_id := parent_isa_id;
      Req.Data.ia_id := ia_id;
      Req.Data.dh_id := dh_id;
      Req.Data.nc_loc_id := nc_loc_id;
      Req.Data.nonce_rem := nonce_rem;
      Req.Data.initiator := initiator;
      Req.Data.spi_loc := spi_loc;
      Req.Data.spi_rem := spi_rem;

      Transport.Client.Send
        (Data => Request.IKE.isa_create_child.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.isa_create_child.Convert.From_Response
        (S => Data);

      sk_ai := Res.Data.sk_ai;
      sk_ar := Res.Data.sk_ar;
      sk_ei := Res.Data.sk_ei;
      sk_er := Res.Data.sk_er;
      Result := Res.Header.Result;
   end isa_create_child;

   -------------------------------------------------------------------------

   procedure isa_reset
     (isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.isa_reset.Request_Type;
      Res  : Response.IKE.isa_reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.isa_reset;
      Req.Data.isa_id := isa_id;

      Transport.Client.Send
        (Data => Request.IKE.isa_reset.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.isa_reset.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end isa_reset;

   -------------------------------------------------------------------------

   procedure isa_sign
     (isa_id : Types.isa_id_type;
      lc_id : Types.lc_id_type;
      init_message : Types.init_message_type;
      signature : out Types.signature_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.isa_sign.Request_Type;
      Res  : Response.IKE.isa_sign.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.isa_sign;
      Req.Data.isa_id := isa_id;
      Req.Data.lc_id := lc_id;
      Req.Data.init_message := init_message;

      Transport.Client.Send
        (Data => Request.IKE.isa_sign.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.isa_sign.Convert.From_Response
        (S => Data);

      signature := Res.Data.signature;
      Result := Res.Header.Result;
   end isa_sign;

   -------------------------------------------------------------------------

   procedure isa_skip_create_first
     (isa_id : Types.isa_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.isa_skip_create_first.Request_Type;
      Res  : Response.IKE.isa_skip_create_first.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.isa_skip_create_first;
      Req.Data.isa_id := isa_id;

      Transport.Client.Send
        (Data => Request.IKE.isa_skip_create_first.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.isa_skip_create_first.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end isa_skip_create_first;

   -------------------------------------------------------------------------

   procedure nc_create
     (nc_id : Types.nc_id_type;
      nonce_length : Types.nonce_length_type;
      nonce : out Types.nonce_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.nc_create.Request_Type;
      Res  : Response.IKE.nc_create.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.nc_create;
      Req.Data.nc_id := nc_id;
      Req.Data.nonce_length := nonce_length;

      Transport.Client.Send
        (Data => Request.IKE.nc_create.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.nc_create.Convert.From_Response
        (S => Data);

      nonce := Res.Data.nonce;
      Result := Res.Header.Result;
   end nc_create;

   -------------------------------------------------------------------------

   procedure nc_reset
     (nc_id : Types.nc_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.nc_reset.Request_Type;
      Res  : Response.IKE.nc_reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.nc_reset;
      Req.Data.nc_id := nc_id;

      Transport.Client.Send
        (Data => Request.IKE.nc_reset.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.nc_reset.Convert.From_Response
        (S => Data);

      Result := Res.Header.Result;
   end nc_reset;

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
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.tkm_limits.Request_Type;
      Res  : Response.IKE.tkm_limits.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.tkm_limits;

      Transport.Client.Send
        (Data => Request.IKE.tkm_limits.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.tkm_limits.Convert.From_Response
        (S => Data);

      max_active_requests := Res.Data.max_active_requests;
      nc_contexts := Res.Data.nc_contexts;
      dh_contexts := Res.Data.dh_contexts;
      cc_contexts := Res.Data.cc_contexts;
      ae_contexts := Res.Data.ae_contexts;
      isa_contexts := Res.Data.isa_contexts;
      esa_contexts := Res.Data.esa_contexts;
      Result := Res.Header.Result;
   end tkm_limits;

   -------------------------------------------------------------------------

   procedure tkm_version
     (version : out Types.version_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.IKE.tkm_version.Request_Type;
      Res  : Response.IKE.tkm_version.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.IKE.tkm_version;

      Transport.Client.Send
        (Data => Request.IKE.tkm_version.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.IKE.tkm_version.Convert.From_Response
        (S => Data);

      version := Res.Data.version;
      Result := Res.Header.Result;
   end tkm_version;

end TKMRPC.Clients.IKE;
