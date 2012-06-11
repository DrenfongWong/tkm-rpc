with Tkmrpc.Types;

package Tkmrpc.Request.Ike.Cc_Add_Certificate is

   Data_Size : constant := 1044;

   type Data_Type is record
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type;
   end record;

   for Data_Type use record
      Cc_Id       at 0 range 0 .. (8 * 8) - 1;
      Autha_Id    at 8 range 0 .. (8 * 8) - 1;
      Certificate at 16 range 0 .. (1028 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Request_Type is record
      Header  : Request.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Request_Type use record
      Header  at 0 range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request.Request_Size * 8;

end Tkmrpc.Request.Ike.Cc_Add_Certificate;
