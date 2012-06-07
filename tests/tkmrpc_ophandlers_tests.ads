with Ahven.Framework;

package TKMRPC_Ophandlers_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Handle_Requests;
   --  Test operation dispatching.

end TKMRPC_Ophandlers_Tests;
