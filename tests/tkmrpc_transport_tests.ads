with Ahven.Framework;

package TKMRPC_Transport_Tests
is
   type Testcase is new Ahven.Framework.Test_Case with null record;

   procedure Initialize (T : in out Testcase);
   --  Initialize testcase.

   procedure Request_Response_Transport;
   --  Test RPC client/server transport layer: Receive request/send response.

   procedure Server_Error_Callbacks;
   --  Test RPC server error callback handling.

end TKMRPC_Transport_Tests;
