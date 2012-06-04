with Interfaces;

with TKMRPC.Nonces;

package TKMRPC.Request.Nonce_Create
is
   Data_Size : constant := 16;

   type Data_Type is record
      Nonce_ID     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Raw_Nonce_Length_Type;
   end record;

   for Data_Type use record
      Nonce_ID     at 0 range 0 .. (8 * 8) - 1;
      Nonce_Length at 8 range 0 .. (8 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Request.Body_Size - Data_Size;

   subtype Padding_Range is Natural range 1 .. Padding_Size;
   type Padding_Type is array (Padding_Range) of Interfaces.Unsigned_8;

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

end TKMRPC.Request.Nonce_Create;
