with Ahven.Framework;

package Tkmrpc_Response_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Stream_Conversion;
   --  Verify response data to/from stream conversions.

end Tkmrpc_Response_Tests;
