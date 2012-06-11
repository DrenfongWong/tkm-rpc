with Tkmrpc.Types;
with Tkmrpc.Operations;

package Tkmrpc.Request is
   Request_Size : constant := 2048;
   Header_Size  : constant := 16;
   Body_Size    : constant := Request_Size - Header_Size;

   type Header_Type is record
      Operation  : Operations.Operation_Type;
      Request_Id : Types.Request_Id_Type;
   end record;

   for Header_Type use record
      Operation  at 0 range 0 .. (8 * 8) - 1;
      Request_Id at 8 range 0 .. (8 * 8) - 1;
   end record;
   for Header_Type'Size use Header_Size * 8;

   subtype Padded_Data_Range is Natural range 1 .. Body_Size;
   subtype Padded_Data_Type is Types.Byte_Sequence (Padded_Data_Range);

   type Data_Type is record
      Header      : Header_Type;
      Padded_Data : Padded_Data_Type;
   end record;

   for Data_Type use record
      Header      at 0 range 0 .. (Header_Size * 8) - 1;
      Padded_Data at Header_Size range 0 .. (Body_Size * 8) - 1;
   end record;
   for Data_Type'Size use Request_Size * 8;

end Tkmrpc.Request;
