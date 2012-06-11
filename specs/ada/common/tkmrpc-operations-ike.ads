package Tkmrpc.Operations.Ike is

   Tkm_Version : constant Operation_Type := 16#0000#;

   Tkm_Limits : constant Operation_Type := 16#0001#;

   Nc_Reset : constant Operation_Type := 16#0100#;

   Nc_Create : constant Operation_Type := 16#0101#;

   Dh_Reset : constant Operation_Type := 16#0200#;

   Dh_Create : constant Operation_Type := 16#0201#;

   Dh_Generate_Key : constant Operation_Type := 16#0202#;

   Cc_Reset : constant Operation_Type := 16#0300#;

   Cc_Set_User_Certificate : constant Operation_Type := 16#0301#;

   Cc_Add_Certificate : constant Operation_Type := 16#0302#;

   Cc_Check_Ca : constant Operation_Type := 16#0303#;

   Ae_Reset : constant Operation_Type := 16#0800#;

   Isa_Reset : constant Operation_Type := 16#0900#;

   Isa_Create : constant Operation_Type := 16#0901#;

   Isa_Sign : constant Operation_Type := 16#0902#;

   Isa_Auth : constant Operation_Type := 16#0903#;

   Isa_Create_Child : constant Operation_Type := 16#0904#;

   Isa_Skip_Create_First : constant Operation_Type := 16#0905#;

   Esa_Reset : constant Operation_Type := 16#0A00#;

   Esa_Create : constant Operation_Type := 16#0A01#;

   Esa_Create_No_Pfs : constant Operation_Type := 16#0A02#;

   Esa_Create_First : constant Operation_Type := 16#0A03#;

   Esa_Select : constant Operation_Type := 16#0A04#;

end Tkmrpc.Operations.Ike;