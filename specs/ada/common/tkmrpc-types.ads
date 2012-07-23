with Interfaces;

package Tkmrpc.Types is

   subtype Byte is Interfaces.Unsigned_8;
   subtype Byte_Sequence_Range is Natural range 0 .. 2 ** 31 - 2;
   type Byte_Sequence is array (Byte_Sequence_Range range <>) of Byte;

   subtype Request_Id_Type is Interfaces.Unsigned_64;

   subtype Version_Type is Interfaces.Unsigned_64;

   subtype Active_Requests_Type is Interfaces.Unsigned_64;

   subtype Authag_Id_Type is Interfaces.Unsigned_64;

   subtype Cag_Id_Type is Interfaces.Unsigned_64;

   subtype Li_Id_Type is Interfaces.Unsigned_64;

   subtype Ri_Id_Type is Interfaces.Unsigned_64;

   subtype Iag_Id_Type is Interfaces.Unsigned_64;

   subtype Eag_Id_Type is Interfaces.Unsigned_64;

   subtype Dhag_Id_Type is Interfaces.Unsigned_64;

   subtype Sp_Id_Type is Interfaces.Unsigned_64;

   subtype Authp_Id_Type is Interfaces.Unsigned_64;

   subtype Dhp_Id_Type is Interfaces.Unsigned_64;

   subtype Autha_Id_Type is Interfaces.Unsigned_64;

   subtype Ca_Id_Type is Interfaces.Unsigned_64;

   subtype Lc_Id_Type is Interfaces.Unsigned_64;

   subtype Ia_Id_Type is Interfaces.Unsigned_64;

   subtype Ea_Id_Type is Interfaces.Unsigned_64;

   subtype Dha_Id_Type is Interfaces.Unsigned_64;

   subtype Nc_Id_Type is Interfaces.Unsigned_64;

   subtype Dh_Id_Type is Interfaces.Unsigned_64;

   subtype Cc_Id_Type is Interfaces.Unsigned_64;

   subtype Ae_Id_Type is Interfaces.Unsigned_64;

   subtype Isa_Id_Type is Interfaces.Unsigned_64;

   subtype Esa_Id_Type is Interfaces.Unsigned_64;

   subtype Abs_Time_Type is Interfaces.Unsigned_64;

   subtype Rel_Time_Type is Interfaces.Unsigned_64;

   subtype Duration_Type is Interfaces.Unsigned_64;

   subtype Counter_Type is Interfaces.Unsigned_64;

   subtype Pfs_Flag_Type is Interfaces.Unsigned_64;

   subtype Cc_Time_Flag_Type is Interfaces.Unsigned_64;

   subtype Auth_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Dh_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Iprf_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Iint_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Ienc_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Eprf_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Eint_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Eenc_Algorithm_Type is Interfaces.Unsigned_64;

   subtype Key_Length_Bits_Type is Interfaces.Unsigned_64;

   subtype Block_Length_Bits_Type is Interfaces.Unsigned_64;

   subtype Init_Type is Interfaces.Unsigned_64;

   subtype Ike_Spi_Type is Interfaces.Unsigned_64;

   subtype Esp_Spi_Type is Interfaces.Unsigned_32;

   subtype Nonce_Length_Type is Interfaces.Unsigned_64;

   subtype Init_Message_Type_Range is Byte_Sequence_Range range 1 .. 1500;
   subtype Init_Message_Type_Data_Type is Byte_Sequence (
     Init_Message_Type_Range);

   type Init_Message_Type is record
      Size : Init_Message_Type_Range;
      Data : Init_Message_Type_Data_Type;
   end record;
   for Init_Message_Type'Size use 1504 * 8;

   Null_Init_Message_Type : constant Init_Message_Type :=
      Init_Message_Type'
     (Size => Init_Message_Type_Range'First,
      Data => Init_Message_Type_Data_Type'(others => 0));

   subtype Certificate_Type_Range is Byte_Sequence_Range range 1 .. 1024;
   subtype Certificate_Type_Data_Type is Byte_Sequence (Certificate_Type_Range)
;

   type Certificate_Type is record
      Size : Certificate_Type_Range;
      Data : Certificate_Type_Data_Type;
   end record;
   for Certificate_Type'Size use 1028 * 8;

   Null_Certificate_Type : constant Certificate_Type :=
      Certificate_Type'
     (Size => Certificate_Type_Range'First,
      Data => Certificate_Type_Data_Type'(others => 0));

   subtype Nonce_Type_Range is Byte_Sequence_Range range 1 .. 256;
   subtype Nonce_Type_Data_Type is Byte_Sequence (Nonce_Type_Range);

   type Nonce_Type is record
      Size : Nonce_Type_Range;
      Data : Nonce_Type_Data_Type;
   end record;
   for Nonce_Type'Size use 260 * 8;

   Null_Nonce_Type : constant Nonce_Type :=
      Nonce_Type'
     (Size => Nonce_Type_Range'First,
      Data => Nonce_Type_Data_Type'(others => 0));

   subtype Dh_Pubvalue_Type_Range is Byte_Sequence_Range range 1 .. 512;
   subtype Dh_Pubvalue_Type_Data_Type is Byte_Sequence (Dh_Pubvalue_Type_Range)
;

   type Dh_Pubvalue_Type is record
      Size : Dh_Pubvalue_Type_Range;
      Data : Dh_Pubvalue_Type_Data_Type;
   end record;
   for Dh_Pubvalue_Type'Size use 516 * 8;

   Null_Dh_Pubvalue_Type : constant Dh_Pubvalue_Type :=
      Dh_Pubvalue_Type'
     (Size => Dh_Pubvalue_Type_Range'First,
      Data => Dh_Pubvalue_Type_Data_Type'(others => 0));

   subtype Dh_Priv_Type_Range is Byte_Sequence_Range range 1 .. 512;
   subtype Dh_Priv_Type_Data_Type is Byte_Sequence (Dh_Priv_Type_Range);

   type Dh_Priv_Type is record
      Size : Dh_Priv_Type_Range;
      Data : Dh_Priv_Type_Data_Type;
   end record;
   for Dh_Priv_Type'Size use 516 * 8;

   Null_Dh_Priv_Type : constant Dh_Priv_Type :=
      Dh_Priv_Type'
     (Size => Dh_Priv_Type_Range'First,
      Data => Dh_Priv_Type_Data_Type'(others => 0));

   subtype Dh_Key_Type_Range is Byte_Sequence_Range range 1 .. 512;
   subtype Dh_Key_Type_Data_Type is Byte_Sequence (Dh_Key_Type_Range);

   type Dh_Key_Type is record
      Size : Dh_Key_Type_Range;
      Data : Dh_Key_Type_Data_Type;
   end record;
   for Dh_Key_Type'Size use 516 * 8;

   Null_Dh_Key_Type : constant Dh_Key_Type :=
      Dh_Key_Type'
     (Size => Dh_Key_Type_Range'First,
      Data => Dh_Key_Type_Data_Type'(others => 0));

   subtype Key_Type_Range is Byte_Sequence_Range range 1 .. 64;
   subtype Key_Type_Data_Type is Byte_Sequence (Key_Type_Range);

   type Key_Type is record
      Size : Key_Type_Range;
      Data : Key_Type_Data_Type;
   end record;
   for Key_Type'Size use 68 * 8;

   Null_Key_Type : constant Key_Type :=
      Key_Type'
     (Size => Key_Type_Range'First,
      Data => Key_Type_Data_Type'(others => 0));

   subtype Identity_Type_Range is Byte_Sequence_Range range 1 .. 64;
   subtype Identity_Type_Data_Type is Byte_Sequence (Identity_Type_Range);

   type Identity_Type is record
      Size : Identity_Type_Range;
      Data : Identity_Type_Data_Type;
   end record;
   for Identity_Type'Size use 68 * 8;

   Null_Identity_Type : constant Identity_Type :=
      Identity_Type'
     (Size => Identity_Type_Range'First,
      Data => Identity_Type_Data_Type'(others => 0));

   subtype Signature_Type_Range is Byte_Sequence_Range range 1 .. 256;
   subtype Signature_Type_Data_Type is Byte_Sequence (Signature_Type_Range);

   type Signature_Type is record
      Size : Signature_Type_Range;
      Data : Signature_Type_Data_Type;
   end record;
   for Signature_Type'Size use 260 * 8;

   Null_Signature_Type : constant Signature_Type :=
      Signature_Type'
     (Size => Signature_Type_Range'First,
      Data => Signature_Type_Data_Type'(others => 0));

   subtype Auth_Parameter_Type_Range is Byte_Sequence_Range range 1 .. 1024;
   subtype Auth_Parameter_Type_Data_Type is Byte_Sequence (
     Auth_Parameter_Type_Range);

   type Auth_Parameter_Type is record
      Size : Auth_Parameter_Type_Range;
      Data : Auth_Parameter_Type_Data_Type;
   end record;
   for Auth_Parameter_Type'Size use 1028 * 8;

   Null_Auth_Parameter_Type : constant Auth_Parameter_Type :=
      Auth_Parameter_Type'
     (Size => Auth_Parameter_Type_Range'First,
      Data => Auth_Parameter_Type_Data_Type'(others => 0));

   subtype Dh_Parameter_Type_Range is Byte_Sequence_Range range 1 .. 1024;
   subtype Dh_Parameter_Type_Data_Type is Byte_Sequence (
     Dh_Parameter_Type_Range);

   type Dh_Parameter_Type is record
      Size : Dh_Parameter_Type_Range;
      Data : Dh_Parameter_Type_Data_Type;
   end record;
   for Dh_Parameter_Type'Size use 1028 * 8;

   Null_Dh_Parameter_Type : constant Dh_Parameter_Type :=
      Dh_Parameter_Type'
     (Size => Dh_Parameter_Type_Range'First,
      Data => Dh_Parameter_Type_Data_Type'(others => 0));

end Tkmrpc.Types;
