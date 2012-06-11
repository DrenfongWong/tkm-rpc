with Tkmrpc.Types;

package Tkmrpc.Response.Ike.Isa_Create_Child is

   Data_Size : constant := 272;

   type Data_Type is record
      Sk_Ai : Types.Key_Type;
      Sk_Ar : Types.Key_Type;
      Sk_Ei : Types.Key_Type;
      Sk_Er : Types.Key_Type;
   end record;

   for Data_Type use record
      Sk_Ai at 0 range 0 .. (68 * 8) - 1;
      Sk_Ar at 68 range 0 .. (68 * 8) - 1;
      Sk_Ei at 136 range 0 .. (68 * 8) - 1;
      Sk_Er at 204 range 0 .. (68 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Response_Type is record
      Header  : Response.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Response_Type use record
      Header  at 0 range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Response_Type'Size use Response.Response_Size * 8;

end Tkmrpc.Response.Ike.Isa_Create_Child;
