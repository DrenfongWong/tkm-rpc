with Tkmrpc.Types;
with Tkmrpc.Operations.Cfg;

--# inherit
--#    Tkmrpc.Types,
--#    Tkmrpc.Response,
--#    Tkmrpc.Operations.CFG,
--#    Tkmrpc.Results;

package Tkmrpc.Response.Cfg.Tkm_Limits is

   Data_Size : constant := 132;

   type Data_Type is record
      Max_Active_Requests : Types.Active_Requests_Type;
      Authag_Contexts     : Types.Authag_Id_Type;
      Cag_Contexts        : Types.Cag_Id_Type;
      Li_Contexts         : Types.Li_Id_Type;
      Ri_Contexts         : Types.Ri_Id_Type;
      Iag_Contexts        : Types.Iag_Id_Type;
      Eag_Contexts        : Types.Eag_Id_Type;
      Dhag_Contexts       : Types.Dhag_Id_Type;
      Sp_Contexts         : Types.Sp_Id_Type;
      Authp_Contexts      : Types.Authp_Id_Type;
      Dhp_Contexts        : Types.Dhp_Id_Type;
      Autha_Contexts      : Types.Autha_Id_Type;
      Ca_Contexts         : Types.Ca_Id_Type;
      Lc_Contexts         : Types.Lc_Id_Type;
      Ia_Contexts         : Types.Ia_Id_Type;
      Ea_Contexts         : Types.Ea_Id_Type;
      Dha_Contexts        : Types.Dha_Id_Type;
   end record;

   for Data_Type use record
      Max_Active_Requests at 0 range 0 .. (8 * 8) - 1;
      Authag_Contexts     at 8 range 0 .. (8 * 8) - 1;
      Cag_Contexts        at 16 range 0 .. (8 * 8) - 1;
      Li_Contexts         at 24 range 0 .. (8 * 8) - 1;
      Ri_Contexts         at 32 range 0 .. (8 * 8) - 1;
      Iag_Contexts        at 40 range 0 .. (8 * 8) - 1;
      Eag_Contexts        at 48 range 0 .. (8 * 8) - 1;
      Dhag_Contexts       at 56 range 0 .. (8 * 8) - 1;
      Sp_Contexts         at 64 range 0 .. (4 * 8) - 1;
      Authp_Contexts      at 68 range 0 .. (8 * 8) - 1;
      Dhp_Contexts        at 76 range 0 .. (8 * 8) - 1;
      Autha_Contexts      at 84 range 0 .. (8 * 8) - 1;
      Ca_Contexts         at 92 range 0 .. (8 * 8) - 1;
      Lc_Contexts         at 100 range 0 .. (8 * 8) - 1;
      Ia_Contexts         at 108 range 0 .. (8 * 8) - 1;
      Ea_Contexts         at 116 range 0 .. (8 * 8) - 1;
      Dha_Contexts        at 124 range 0 .. (8 * 8) - 1;
   end record;
   for Data_Type'Size use Data_Size * 8;

   Padding_Size : constant := Response.Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Response_Type is record
      Header  : Response.Header_Type;
      Data    : Data_Type;
      Padding : Padding_Type;
   end record;

   for Response_Type use record
      Header  at 0 range 0 .. (Response.Header_Size * 8) - 1;
      Data    at Response.Header_Size range 0 .. (Data_Size * 8) - 1;
      Padding at Response.Header_Size + Data_Size range
         0 .. (Padding_Size * 8) - 1;
   end record;
   for Response_Type'Size use Response.Response_Size * 8;

   Null_Response : constant Response_Type :=
      Response_Type'
     (Header  =>
     Response.Header_Type'(Operation  => Operations.Cfg.Tkm_Limits,
                           Result     => Results.Invalid_Operation,
                           Request_Id => 0),
      Data    =>
     Data_Type'(Max_Active_Requests => Types.Active_Requests_Type'First,
                Authag_Contexts     => Types.Authag_Id_Type'First,
                Cag_Contexts        => Types.Cag_Id_Type'First,
                Li_Contexts         => Types.Li_Id_Type'First,
                Ri_Contexts         => Types.Ri_Id_Type'First,
                Iag_Contexts        => Types.Iag_Id_Type'First,
                Eag_Contexts        => Types.Eag_Id_Type'First,
                Dhag_Contexts       => Types.Dhag_Id_Type'First,
                Sp_Contexts         => Types.Sp_Id_Type'First,
                Authp_Contexts      => Types.Authp_Id_Type'First,
                Dhp_Contexts        => Types.Dhp_Id_Type'First,
                Autha_Contexts      => Types.Autha_Id_Type'First,
                Ca_Contexts         => Types.Ca_Id_Type'First,
                Lc_Contexts         => Types.Lc_Id_Type'First,
                Ia_Contexts         => Types.Ia_Id_Type'First,
                Ea_Contexts         => Types.Ea_Id_Type'First,
                Dha_Contexts        => Types.Dha_Id_Type'First),
      Padding => Padding_Type'(others => 0));

end Tkmrpc.Response.Cfg.Tkm_Limits;
