with Interfaces;

with TKMRPC.Types;

package TKMRPC.Nonces
is

   subtype Nonce_Id_Type is Interfaces.Unsigned_64;

   subtype Nonce_Range is Natural range 1 .. 256;
   subtype Nonce_Value_Type is Types.Byte_Array (Nonce_Range);

   subtype Raw_Nonce_Length_Type is Interfaces.Unsigned_64;
   subtype Nonce_Length_Type is
     Raw_Nonce_Length_Type range 16 .. Nonce_Value_Type'Length;

   type Nonce_Type is record
      Value  : Nonce_Value_Type;
      Length : Nonce_Length_Type;
   end record;

end TKMRPC.Nonces;
