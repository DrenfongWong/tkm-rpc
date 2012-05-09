with Ada.Streams;
with Ada.Unchecked_Conversion;

package TKMRPC.Response.Convert
is
   use type Ada.Streams.Stream_Element_Offset;

   subtype Stream_Range is
     Ada.Streams.Stream_Element_Offset range 1 .. Response_Size;
   subtype Stream_Type is Ada.Streams.Stream_Element_Array (Stream_Range);

   function To_Stream is new
     Ada.Unchecked_Conversion
       (Source => Data_Type,
        Target => Stream_Type);
   --  Convert given response data to stream array.

   function From_Stream is new
     Ada.Unchecked_Conversion
       (Source => Stream_Type,
        Target => Data_Type);
   --  Convert stream array to response data.

end TKMRPC.Response.Convert;
