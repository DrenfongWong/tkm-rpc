with Interfaces;

package TKMRPC.Results
is
   subtype Result_Type is Interfaces.Unsigned_64;

   OK                : constant Result_Type := 0;
   Invalid_Operation : constant Result_Type := 16#101#;
   Invalid_ID        : constant Result_Type := 16#102#;
   Invalid_State     : constant Result_Type := 16#103#;
   Invalid_Parameter : constant Result_Type := 16#104#;
   Random_Failure    : constant Result_Type := 16#201#;
   Signer_Failure    : constant Result_Type := 16#202#;
   Aborted           : constant Result_Type := 16#301#;

end TKMRPC.Results;
