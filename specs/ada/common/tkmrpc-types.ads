with Interfaces;

package Tkmrpc.Types is

   subtype Byte is Interfaces.Unsigned_8;
   subtype Byte_Sequence_Range is Natural range 0 .. 2 ** 31 - 2;
   type Byte_Sequence is array (Byte_Sequence_Range range <>) of Byte;
   type Request_Id_Type is new Interfaces.Unsigned_64;

   type Version_Type is new Interfaces.Unsigned_64;

   type Active_Requests_Type is new Interfaces.Unsigned_64;

   type Authag_Id_Type is new Interfaces.Unsigned_64;

   type Cag_Id_Type is new Interfaces.Unsigned_64;

   type Li_Id_Type is new Interfaces.Unsigned_64;

   type Ri_Id_Type is new Interfaces.Unsigned_64;

   type Iag_Id_Type is new Interfaces.Unsigned_64;

   type Eag_Id_Type is new Interfaces.Unsigned_64;

   type Dhag_Id_Type is new Interfaces.Unsigned_64;

   type Sp_Id_Type is new Interfaces.Unsigned_64;

   type Authp_Id_Type is new Interfaces.Unsigned_64;

   type Dhp_Id_Type is new Interfaces.Unsigned_64;

   type Autha_Id_Type is new Interfaces.Unsigned_64;

   type Ca_Id_Type is new Interfaces.Unsigned_64;

   type Lc_Id_Type is new Interfaces.Unsigned_64;

   type Ia_Id_Type is new Interfaces.Unsigned_64;

   type Ea_Id_Type is new Interfaces.Unsigned_64;

   type Dha_Id_Type is new Interfaces.Unsigned_64;

   type Nc_Id_Type is new Interfaces.Unsigned_64;

   type Dh_Id_Type is new Interfaces.Unsigned_64;

   type Cc_Id_Type is new Interfaces.Unsigned_64;

   type Ae_Id_Type is new Interfaces.Unsigned_64;

   type Isa_Id_Type is new Interfaces.Unsigned_64;

   type Esa_Id_Type is new Interfaces.Unsigned_64;

   type Abs_Time_Type is new Interfaces.Unsigned_64;

   type Rel_Time_Type is new Interfaces.Unsigned_64;

   type Duration_Type is new Interfaces.Unsigned_64;

   type Counter_Type is new Interfaces.Unsigned_64;

   type Pfs_Flag_Type is new Interfaces.Unsigned_64;

   type Cc_Time_Flag_Type is new Interfaces.Unsigned_64;

   type Auth_Algorithm_Type is new Interfaces.Unsigned_64;

   type Dh_Algorithm_Type is new Interfaces.Unsigned_64;

   type Iprf_Algorithm_Type is new Interfaces.Unsigned_64;

   type Iint_Algorithm_Type is new Interfaces.Unsigned_64;

   type Ienc_Algorithm_Type is new Interfaces.Unsigned_64;

   type Eprf_Algorithm_Type is new Interfaces.Unsigned_64;

   type Eint_Algorithm_Type is new Interfaces.Unsigned_64;

   type Eenc_Algorithm_Type is new Interfaces.Unsigned_64;

   type Key_Length_Bits_Type is new Interfaces.Unsigned_64;

   type Block_Length_Bits_Type is new Interfaces.Unsigned_64;

   type Init_Type is new Interfaces.Unsigned_64;

   type Ike_Spi_Type is new Interfaces.Unsigned_64;

   type Esp_Spi_Type is new Interfaces.Unsigned_32;

   type Nonce_Length_Type is new Interfaces.Unsigned_64;

   type Init_Message_Type is record
      Size : Interfaces.Unsigned_32    := 0;
      Data : Byte_Sequence (1 .. 1500) := (others => 0);
   end record;
   for Init_Message_Type'Size use 1504 * 8;

   type Certificate_Type is record
      Size : Interfaces.Unsigned_32    := 0;
      Data : Byte_Sequence (1 .. 1024) := (others => 0);
   end record;
   for Certificate_Type'Size use 1028 * 8;

   type Nonce_Type is record
      Size : Interfaces.Unsigned_32   := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for Nonce_Type'Size use 260 * 8;

   type Dh_Pubvalue_Type is record
      Size : Interfaces.Unsigned_32   := 0;
      Data : Byte_Sequence (1 .. 512) := (others => 0);
   end record;
   for Dh_Pubvalue_Type'Size use 516 * 8;

   type Dh_Priv_Type is record
      Size : Interfaces.Unsigned_32   := 0;
      Data : Byte_Sequence (1 .. 512) := (others => 0);
   end record;
   for Dh_Priv_Type'Size use 516 * 8;

   type Dh_Key_Type is record
      Size : Interfaces.Unsigned_32   := 0;
      Data : Byte_Sequence (1 .. 512) := (others => 0);
   end record;
   for Dh_Key_Type'Size use 516 * 8;

   type Key_Type is record
      Size : Interfaces.Unsigned_32  := 0;
      Data : Byte_Sequence (1 .. 64) := (others => 0);
   end record;
   for Key_Type'Size use 68 * 8;

   type Identity_Type is record
      Size : Interfaces.Unsigned_32  := 0;
      Data : Byte_Sequence (1 .. 64) := (others => 0);
   end record;
   for Identity_Type'Size use 68 * 8;

   type Signature_Type is record
      Size : Interfaces.Unsigned_32   := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for Signature_Type'Size use 260 * 8;

   type Auth_Parameter_Type is record
      Size : Interfaces.Unsigned_32    := 0;
      Data : Byte_Sequence (1 .. 1024) := (others => 0);
   end record;
   for Auth_Parameter_Type'Size use 1028 * 8;

   type Dh_Parameter_Type is record
      Size : Interfaces.Unsigned_32    := 0;
      Data : Byte_Sequence (1 .. 1024) := (others => 0);
   end record;
   for Dh_Parameter_Type'Size use 1028 * 8;

end Tkmrpc.Types;
