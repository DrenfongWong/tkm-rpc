with Ahven.Framework;

package TKMRPC_Implementation_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Register_Implementation;
   --  Test registration of TKM implementation.

end TKMRPC_Implementation_Tests;
