with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Operations;

package Test_Utils
is
   use TKMRPC;

   Test_Request  : constant Request.Data_Type
     := (Header      =>
           (Operation  => TKMRPC.Operations.Nonce_Create,
            Request_ID => 234234234),
         Padded_Data => (others => Character'Pos ('a')));
   --  Request data used in tests.

   Test_Response : constant Response.Data_Type
     := (Header      =>
           (Operation  => TKMRPC.Operations.Nonce_Create,
            Request_ID => 901213123123,
            Result     => 7662524),
         Padded_Data => (others => Character'Pos ('c')));
   --  Response data used in tests.

end Test_Utils;
