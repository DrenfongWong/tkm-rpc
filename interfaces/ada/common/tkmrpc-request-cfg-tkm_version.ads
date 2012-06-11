with TKMRPC.Types;

package TKMRPC.Request.CFG.tkm_version
is

   Data_Size : constant := 0;

   type Data_Type is null record;
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

end TKMRPC.Request.CFG.tkm_version;
