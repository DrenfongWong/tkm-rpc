with TKMRPC.Types;

package TKMRPC.Request.IKE.dh_generate_key
is

   Data_Size : constant := 268;

   type Data_Type is record
      dh_id : Types.dh_id_type;
      pubvalue : Types.dh_pubvalue_type;
   end record;

   for Data_Type use record
      dh_id at 0 range 0 .. (8 * 8) - 1;
      pubvalue at 8 range 0 .. (260 * 8) - 1;
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
      Header  at 0                       range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size             range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request.Request_Size * 8;

end TKMRPC.Request.IKE.dh_generate_key;
