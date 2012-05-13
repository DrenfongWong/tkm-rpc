with Ahven.Framework;

package TKMRPC_Transport_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Request_Response_Transport;
   --  Test RPC client/server transport layer: Receive request/send response.

end TKMRPC_Transport_Tests;
