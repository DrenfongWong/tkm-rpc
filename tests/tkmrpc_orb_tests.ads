with Ahven.Framework;

package TKMRPC_ORB_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Client_Server_ORBs;
   --  Test client/server ORB interaction.

end TKMRPC_ORB_Tests;
