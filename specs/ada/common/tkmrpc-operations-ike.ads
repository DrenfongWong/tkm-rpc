package TKMRPC.Operations.IKE
is

   tkm_version : constant Operation_Type := 16#0000#;

   tkm_limits : constant Operation_Type := 16#0001#;

   nc_reset : constant Operation_Type := 16#0100#;

   nc_create : constant Operation_Type := 16#0101#;

   dh_reset : constant Operation_Type := 16#0200#;

   dh_create : constant Operation_Type := 16#0201#;

   dh_generate_key : constant Operation_Type := 16#0202#;

   cc_reset : constant Operation_Type := 16#0300#;

   cc_set_user_certificate : constant Operation_Type := 16#0301#;

   cc_add_certificate : constant Operation_Type := 16#0302#;

   cc_check_ca : constant Operation_Type := 16#0303#;

   ae_reset : constant Operation_Type := 16#0800#;

   isa_reset : constant Operation_Type := 16#0900#;

   isa_create : constant Operation_Type := 16#0901#;

   isa_sign : constant Operation_Type := 16#0902#;

   isa_auth : constant Operation_Type := 16#0903#;

   isa_create_child : constant Operation_Type := 16#0904#;

   isa_skip_create_first : constant Operation_Type := 16#0905#;

   esa_reset : constant Operation_Type := 16#0A00#;

   esa_create : constant Operation_Type := 16#0A01#;

   esa_create_no_pfs : constant Operation_Type := 16#0A02#;

   esa_create_first : constant Operation_Type := 16#0A03#;

   esa_select : constant Operation_Type := 16#0A04#;

end TKMRPC.Operations.IKE;
