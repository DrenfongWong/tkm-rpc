with Ahven.Framework;

package Tkmrpc_ORB_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Client_Server_ORBs;
   --  Test client/server ORB interaction.

   procedure C_Test_Client;
   --  Test interaction with client written in C.

end Tkmrpc_ORB_Tests;
