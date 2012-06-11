with Tkmrpc.Types;

package Tkmrpc.Request.Ike.Isa_Create_Child is

   Data_Size : constant := 324;

   type Data_Type is record
      Isa_Id        : Types.Isa_Id_Type;
      Parent_Isa_Id : Types.Isa_Id_Type;
      Ia_Id         : Types.Ia_Id_Type;
      Dh_Id         : Types.Dh_Id_Type;
      Nc_Loc_Id     : Types.Nc_Id_Type;
      Nonce_Rem     : Types.Nonce_Type;
      Initiator     : Types.Init_Type;
      Spi_Loc       : Types.Ike_Spi_Type;
      Spi_Rem       : Types.Ike_Spi_Type;
   end record;

   for Data_Type use record
      Isa_Id        at 0 range 0 .. (8 * 8) - 1;
      Parent_Isa_Id at 8 range 0 .. (8 * 8) - 1;
      Ia_Id         at 16 range 0 .. (8 * 8) - 1;
      Dh_Id         at 24 range 0 .. (8 * 8) - 1;
      Nc_Loc_Id     at 32 range 0 .. (8 * 8) - 1;
      Nonce_Rem     at 40 range 0 .. (260 * 8) - 1;
      Initiator     at 300 range 0 .. (8 * 8) - 1;
      Spi_Loc       at 308 range 0 .. (8 * 8) - 1;
      Spi_Rem       at 316 range 0 .. (8 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Request_Type is record
      Header  : Request.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Request_Type use record
      Header  at 0 range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request.Request_Size * 8;

end Tkmrpc.Request.Ike.Isa_Create_Child;
