with TKMRPC.Types;

package TKMRPC.Request.IKE.isa_create
is

   Data_Size : constant := 324;

   type Data_Type is record
      isa_id : Types.isa_id_type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      dh_id : Types.dh_id_type;
      nc_loc_id : Types.nc_id_type;
      nonce_rem : Types.nonce_type;
      initiator : Types.init_type;
      spi_loc : Types.ike_spi_type;
      spi_rem : Types.ike_spi_type;
   end record;

   for Data_Type use record
      isa_id at 0 range 0 .. (8 * 8) - 1;
      ae_id at 8 range 0 .. (8 * 8) - 1;
      ia_id at 16 range 0 .. (8 * 8) - 1;
      dh_id at 24 range 0 .. (8 * 8) - 1;
      nc_loc_id at 32 range 0 .. (8 * 8) - 1;
      nonce_rem at 40 range 0 .. (260 * 8) - 1;
      initiator at 300 range 0 .. (8 * 8) - 1;
      spi_loc at 308 range 0 .. (8 * 8) - 1;
      spi_rem at 316 range 0 .. (8 * 8) - 1;
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
      Header  at 0                       range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size             range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request.Request_Size * 8;

end TKMRPC.Request.IKE.isa_create;
