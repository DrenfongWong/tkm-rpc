with Tkmrpc.Types;
with Tkmrpc.Operations.Ike;

package Tkmrpc.Request.Ike.Isa_Sign_Psk is

   Data_Size : constant := 1645;

   type Data_Type is record
      Isa_Id       : Types.Isa_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Idx          : Types.Idx_Type;
      Verify       : Types.Verify_Type;
   end record;

   for Data_Type use record
      Isa_Id       at 0 range 0 .. (8 * 8) - 1;
      Init_Message at 8 range 0 .. (1504 * 8) - 1;
      Idx          at 1512 range 0 .. (132 * 8) - 1;
      Verify       at 1644 range 0 .. (1 * 8) - 1;
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
     Request.Header_Type'(Operation  => Operations.Ike.Isa_Sign_Psk,
                          Request_Id => 0),
      Data    =>
     Data_Type'(Isa_Id       => Types.Isa_Id_Type'First,
                Init_Message => Types.Null_Init_Message_Type,
                Idx          => Types.Null_Idx_Type,
                Verify       => Types.Verify_Type'First),
      Padding => Padding_Type'(others => 0));

end Tkmrpc.Request.Ike.Isa_Sign_Psk;
