with TKMRPC.Types;

package TKMRPC.Response.IKE.tkm_limits
is

   Data_Size : constant := 56;

   type Data_Type is record
      max_active_requests : Types.active_requests_type;
      nc_contexts : Types.nc_id_type;
      dh_contexts : Types.dh_id_type;
      cc_contexts : Types.cc_id_type;
      ae_contexts : Types.ae_id_type;
      isa_contexts : Types.isa_id_type;
      esa_contexts : Types.esa_id_type;
   end record;

   for Data_Type use record
      max_active_requests at 0 range 0 .. (8 * 8) - 1;
      nc_contexts at 8 range 0 .. (8 * 8) - 1;
      dh_contexts at 16 range 0 .. (8 * 8) - 1;
      cc_contexts at 24 range 0 .. (8 * 8) - 1;
      ae_contexts at 32 range 0 .. (8 * 8) - 1;
      isa_contexts at 40 range 0 .. (8 * 8) - 1;
      esa_contexts at 48 range 0 .. (8 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Response_Type is record
      Header  : Response.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Response_Type use record
      Header  at 0                       range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size             range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Response_Type'Size use Response.Response_Size * 8;

end TKMRPC.Response.IKE.tkm_limits;
