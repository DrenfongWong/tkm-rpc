with Tkmrpc.Types;

package Tkmrpc.Response.Ike.Tkm_Limits is

   Data_Size : constant := 56;

   type Data_Type is record
      Max_Active_Requests : Types.Active_Requests_Type;
      Nc_Contexts         : Types.Nc_Id_Type;
      Dh_Contexts         : Types.Dh_Id_Type;
      Cc_Contexts         : Types.Cc_Id_Type;
      Ae_Contexts         : Types.Ae_Id_Type;
      Isa_Contexts        : Types.Isa_Id_Type;
      Esa_Contexts        : Types.Esa_Id_Type;
   end record;

   for Data_Type use record
      Max_Active_Requests at 0 range 0 .. (8 * 8) - 1;
      Nc_Contexts         at 8 range 0 .. (8 * 8) - 1;
      Dh_Contexts         at 16 range 0 .. (8 * 8) - 1;
      Cc_Contexts         at 24 range 0 .. (8 * 8) - 1;
      Ae_Contexts         at 32 range 0 .. (8 * 8) - 1;
      Isa_Contexts        at 40 range 0 .. (8 * 8) - 1;
      Esa_Contexts        at 48 range 0 .. (8 * 8) - 1;
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
      Header  at 0 range 0 .. (Header_Size * 8) - 1;
      Data    at Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Header_Size + Data_Size range 0 .. (Padding_Size * 8) - 1;
   end record;
   for Response_Type'Size use Response.Response_Size * 8;

end Tkmrpc.Response.Ike.Tkm_Limits;