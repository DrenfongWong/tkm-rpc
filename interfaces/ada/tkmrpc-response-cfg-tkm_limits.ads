with TKMRPC.Types;

package TKMRPC.Response.CFG.tkm_limits
is

   Data_Size : constant := 136;

   type Data_Type is record
      max_active_requests : Types.active_requests_type;
      authag_contexts : Types.authag_id_type;
      cag_contexts : Types.cag_id_type;
      li_contexts : Types.li_id_type;
      ri_contexts : Types.ri_id_type;
      iag_contexts : Types.iag_id_type;
      eag_contexts : Types.eag_id_type;
      dhag_contexts : Types.dhag_id_type;
      sp_contexts : Types.sp_id_type;
      authp_contexts : Types.authp_id_type;
      dhp_contexts : Types.dhp_id_type;
      autha_contexts : Types.autha_id_type;
      ca_contexts : Types.ca_id_type;
      lc_contexts : Types.lc_id_type;
      ia_contexts : Types.ia_id_type;
      ea_contexts : Types.ea_id_type;
      dha_contexts : Types.dha_id_type;
   end record;

   for Data_Type use record
      max_active_requests at 0 range 0 .. (8 * 8) - 1;
      authag_contexts at 8 range 0 .. (8 * 8) - 1;
      cag_contexts at 16 range 0 .. (8 * 8) - 1;
      li_contexts at 24 range 0 .. (8 * 8) - 1;
      ri_contexts at 32 range 0 .. (8 * 8) - 1;
      iag_contexts at 40 range 0 .. (8 * 8) - 1;
      eag_contexts at 48 range 0 .. (8 * 8) - 1;
      dhag_contexts at 56 range 0 .. (8 * 8) - 1;
      sp_contexts at 64 range 0 .. (8 * 8) - 1;
      authp_contexts at 72 range 0 .. (8 * 8) - 1;
      dhp_contexts at 80 range 0 .. (8 * 8) - 1;
      autha_contexts at 88 range 0 .. (8 * 8) - 1;
      ca_contexts at 96 range 0 .. (8 * 8) - 1;
      lc_contexts at 104 range 0 .. (8 * 8) - 1;
      ia_contexts at 112 range 0 .. (8 * 8) - 1;
      ea_contexts at 120 range 0 .. (8 * 8) - 1;
      dha_contexts at 128 range 0 .. (8 * 8) - 1;
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

end TKMRPC.Response.CFG.tkm_limits;
