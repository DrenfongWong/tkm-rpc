with Ada.Streams;
with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Convert is

   subtype Stream_Range is Ada.Streams.Stream_Element_Offset range
      1 .. Request_Size;
   subtype Stream_Type is Ada.Streams.Stream_Element_Array (Stream_Range);

   function To_Stream is new Ada.Unchecked_Conversion (
      Source => Data_Type,
      Target => Stream_Type);
   --  Convert given request data to stream array.

   function From_Stream is new Ada.Unchecked_Conversion (
      Source => Stream_Type,
      Target => Data_Type);
   --  Convert stream array to request data.

end Tkmrpc.Request.Convert;
