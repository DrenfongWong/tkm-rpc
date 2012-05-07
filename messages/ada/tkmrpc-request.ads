with TKMRPC.Types;
with TKMRPC.Operations;

package TKMRPC.Request
is
   Request_Size : constant := 2048;
   Header_Size  : constant := 16;
   Body_Size    : constant := Request_Size - Header_Size;

   type Header_Type is record
      Operation  : Operations.Operation_Type;
      Request_ID : Types.Request_ID_Type;
   end record;

   for Header_Type use record
      Operation  at 0 range 0 .. (8 * 8) - 1;
      Request_ID at 8 range 0 .. (8 * 8) - 1;
   end record;
   for Header_Type'Size use Header_Size * 8;

   subtype Padded_Data_Range is Natural range 1 .. Body_Size;
   subtype Padded_Data_Type is Types.Byte_Array (Padded_Data_Range);

   type Request_Type is record
      Header : Header_Type;
      Data   : Padded_Data_Type;
   end record;

   for Request_Type use record
      Header at 0           range 0 .. (Header_Size * 8) - 1;
      Data   at Header_Size range 0 .. (Body_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request_Size * 8;

end TKMRPC.Request;
