with Tkmrpc.Types;

package Tkmrpc.Constants is

   Cfg_Version : constant Types.Version_Type := 16#0000000000000000#;
   Ees_Version : constant Types.Version_Type := 16#0000000000000000#;
   Ike_Version : constant Types.Version_Type := 16#0000000000000000#;

   Modp_2048 : constant Types.Dh_Algorithm_Type := 16#000000000000000e#;
   Modp_3072 : constant Types.Dh_Algorithm_Type := 16#000000000000000f#;
   Modp_4096 : constant Types.Dh_Algorithm_Type := 16#0000000000000010#;

   Proto_Esp : constant Types.Protocol_Type := 16#32#;
   Proto_Ah  : constant Types.Protocol_Type := 16#33#;

end Tkmrpc.Constants;
