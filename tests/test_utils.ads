with TKMRPC.Request;
with TKMRPC.Response;

package Test_Utils
is
   use TKMRPC;

   Test_Operation : constant := 999999;
   --  Fake operation code used in tests.

   Test_Request  : constant Request.Data_Type
     := (Header      =>
           (Operation  => Test_Operation,
            Request_ID => 234234234),
         Padded_Data => (others => Character'Pos ('a')));
   --  Request data used in tests.

   Test_Response : constant Response.Data_Type
     := (Header      =>
           (Operation  => Test_Operation,
            Request_ID => 234234234,
            Result     => 7662524),
         Padded_Data => (others => Character'Pos ('c')));
   --  Response data used in tests.

end Test_Utils;
