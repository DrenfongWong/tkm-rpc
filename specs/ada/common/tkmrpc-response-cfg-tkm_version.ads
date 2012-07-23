with Tkmrpc.Types;

package Tkmrpc.Response.Cfg.Tkm_Version is

   Data_Size : constant := 8;

   type Data_Type is record
      Version : Types.Version_Type;
   end record;

   for Data_Type use record
      Version at 0 range 0 .. (8 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Response.Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Response_Type is record
      Header  : Response.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Response_Type use record
      Header  at 0 range 0 .. (Response.Header_Size * 8) - 1;
      Data    at Response.Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Response.Header_Size + Data_Size range
         0 .. (Padding_Size * 8) - 1;
   end record;
   for Response_Type'Size use Response.Response_Size * 8;

end Tkmrpc.Response.Cfg.Tkm_Version;
