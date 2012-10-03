with Tkmrpc.Types;
with Tkmrpc.Operations.Cfg;

package Tkmrpc.Request.Cfg.Tkm_Limits is

   Data_Size : constant := 0;

   Padding_Size : constant := Request.Body_Size - Data_Size;
   subtype Padding_Range is Natural range 1 .. Padding_Size;
   subtype Padding_Type is Types.Byte_Sequence (Padding_Range);

   type Request_Type is record
      Header  : Request.Header_Type;
      Padding : Padding_Type;
   end record;

   for Request_Type use record
      Header  at 0 range 0 .. (Request.Header_Size * 8) - 1;
      Padding at Request.Header_Size + Data_Size range
         0 .. (Padding_Size * 8) - 1;
   end record;
   for Request_Type'Size use Request.Request_Size * 8;

   Null_Request : constant Request_Type :=
      Request_Type'
     (Header  =>
     Request.Header_Type'(Operation  => Operations.Cfg.Tkm_Limits,
                          Request_Id => 0),
      Padding => Padding_Type'(others => 0));

end Tkmrpc.Request.Cfg.Tkm_Limits;
