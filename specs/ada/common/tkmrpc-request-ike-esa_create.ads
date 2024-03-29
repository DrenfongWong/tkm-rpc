with Tkmrpc.Types;
with Tkmrpc.Operations.Ike;

package Tkmrpc.Request.Ike.Esa_Create is

   Data_Size : constant := 320;

   type Data_Type is record
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Dh_Id       : Types.Dh_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type;
   end record;

   for Data_Type use record
      Esa_Id      at 0 range 0 .. (8 * 8) - 1;
      Isa_Id      at 8 range 0 .. (8 * 8) - 1;
      Sp_Id       at 16 range 0 .. (4 * 8) - 1;
      Ea_Id       at 20 range 0 .. (8 * 8) - 1;
      Dh_Id       at 28 range 0 .. (8 * 8) - 1;
      Nc_Loc_Id   at 36 range 0 .. (8 * 8) - 1;
      Nonce_Rem   at 44 range 0 .. (260 * 8) - 1;
      Initiator   at 304 range 0 .. (8 * 8) - 1;
      Esp_Spi_Loc at 312 range 0 .. (4 * 8) - 1;
      Esp_Spi_Rem at 316 range 0 .. (4 * 8) - 1;
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
     Request.Header_Type'(Operation  => Operations.Ike.Esa_Create,
                          Request_Id => 0),
      Data    =>
     Data_Type'(Esa_Id      => Types.Esa_Id_Type'First,
                Isa_Id      => Types.Isa_Id_Type'First,
                Sp_Id       => Types.Sp_Id_Type'First,
                Ea_Id       => Types.Ea_Id_Type'First,
                Dh_Id       => Types.Dh_Id_Type'First,
                Nc_Loc_Id   => Types.Nc_Id_Type'First,
                Nonce_Rem   => Types.Null_Nonce_Type,
                Initiator   => Types.Init_Type'First,
                Esp_Spi_Loc => Types.Esp_Spi_Type'First,
                Esp_Spi_Rem => Types.Esp_Spi_Type'First),
      Padding => Padding_Type'(others => 0));

end Tkmrpc.Request.Ike.Esa_Create;
