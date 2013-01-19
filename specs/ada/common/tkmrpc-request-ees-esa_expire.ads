with Tkmrpc.Types;
with Tkmrpc.Operations.Ees;

package Tkmrpc.Request.Ees.Esa_Expire is

   Data_Size : constant := 13;

   type Data_Type is record
      Sp_Id    : Types.Sp_Id_Type;
      Spi_Rem  : Types.Esp_Spi_Type;
      Protocol : Types.Protocol_Type;
      Hard     : Types.Expiry_Flag_Type;
   end record;

   for Data_Type use record
      Sp_Id    at 0 range 0 .. (4 * 8) - 1;
      Spi_Rem  at 4 range 0 .. (4 * 8) - 1;
      Protocol at 8 range 0 .. (4 * 8) - 1;
      Hard     at 12 range 0 .. (1 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Request.Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Request_Type is record
      Header  : Request.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Request_Type use record
      Header  at 0 range 0 .. (Request.Header_Size * 8) - 1;
      Data    at Request.Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Request.Header_Size + Data_Size range
         0 .. (Padding_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request.Request_Size * 8;

   Null_Request : constant Request_Type :=
      Request_Type'
     (Header  =>
     Request.Header_Type'(Operation  => Operations.Ees.Esa_Expire,
                          Request_Id => 0),
      Data    =>
     Data_Type'(Sp_Id    => Types.Sp_Id_Type'First,
                Spi_Rem  => Types.Esp_Spi_Type'First,
                Protocol => Types.Protocol_Type'First,
                Hard     => Types.Expiry_Flag_Type'First),
      Padding => Padding_Type'(others => 0));

end Tkmrpc.Request.Ees.Esa_Expire;
