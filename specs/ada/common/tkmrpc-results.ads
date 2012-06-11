with Interfaces;

package Tkmrpc.Results is

   subtype Result_Type is Interfaces.Unsigned_64;

   Ok                : constant Result_Type := 16#0000000000000000#;
   Invalid_Operation : constant Result_Type := 16#0000000000000101#;
   Invalid_Id        : constant Result_Type := 16#0000000000000102#;
   Invalid_State     : constant Result_Type := 16#0000000000000103#;
   Invalid_Parameter : constant Result_Type := 16#0000000000000104#;
   Random_Failure    : constant Result_Type := 16#0000000000000201#;
   Sign_Failure      : constant Result_Type := 16#0000000000000202#;
   Aborted           : constant Result_Type := 16#0000000000000301#;
   Math_Error        : constant Result_Type := 16#0000000000000401#;

end Tkmrpc.Results;
