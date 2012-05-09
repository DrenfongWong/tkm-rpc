with TKMRPC.Types;
with TKMRPC.Operations;
with TKMRPC.Results;

package TKMRPC.Response
is
   Response_Size : constant := 1024;
   Header_Size   : constant := 24;
   Body_Size     : constant := Response_Size - Header_Size;

   type Header_Type is record
      Operation  : Operations.Operation_Type;
      Request_ID : Types.Request_ID_Type;
      Result     : Results.Result_Type;
   end record;

   for Header_Type use record
      Operation  at  0 range 0 .. (8 * 8) - 1;
      Request_ID at  8 range 0 .. (8 * 8) - 1;
      Result     at 16 range 0 .. (8 * 8) - 1;
   end record;
   for Header_Type'Size use Header_Size * 8;

   subtype Padded_Data_Range is Natural range 1 .. Body_Size;
   subtype Padded_Data_Type is Types.Byte_Array (Padded_Data_Range);

   type Data_Type is record
      Header      : Header_Type;
      Padded_Data : Padded_Data_Type;
   end record;

   for Data_Type use record
      Header      at 0           range 0 .. (Header_Size * 8) - 1;
      Padded_Data at Header_Size range 0 .. (Body_Size * 8) - 1;
   end record;
   for Data_Type'Size use Response_Size * 8;

end TKMRPC.Response;