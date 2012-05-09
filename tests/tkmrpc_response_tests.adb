with Interfaces.C;

with System;

with TKMRPC.Response;
with TKMRPC.Operations;

package body TKMRPC_Response_Tests is

   use Ahven;
   use TKMRPC;

   package IC renames Interfaces.C;

   function C_Assert_Response (Res : System.Address) return IC.int;
   pragma Import (C, C_Assert_Response, "assert_response");

   -------------------------------------------------------------------------

   procedure Assert_Response_Compliance
   is
      use type IC.int;
      use type Operations.Operation_Type;
      use type Response.Padded_Data_Type;

      My_Res   : Response.Data_Type
        := (Header      =>
              (Operation  => TKMRPC.Operations.Nonce_Create,
               Request_ID => 901213123123,
               Result     => 7662524),
            Padded_Data => (others => Character'Pos ('c')));
      Ref_Data : Response.Padded_Data_Type
        := (others => Character'Pos ('d'));
   begin
      My_Res.Padded_Data (Response.Padded_Data_Range'Last)
        := Character'Pos ('x');
      Assert (Condition => C_Assert_Response (Res => My_Res'Address) = 1,
              Message   => "Not C compliant");

      Ref_Data (Response.Padded_Data_Range'Last) := Character'Pos ('y');
      Assert (Condition => My_Res.Header.Operation = Operations.Nonce_Reset,
              Message   => "Operation mismatch");
      Assert (Condition => My_Res.Header.Request_ID = 9999999123111111,
              Message   => "Request ID mismatch");
      Assert (Condition => My_Res.Header.Result = 33393933393,
              Message   => "Result mismatch");
      Assert (Condition => My_Res.Padded_Data = Ref_Data,
              Message   => "Data mismatch");
   end Assert_Response_Compliance;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Response tests");
      T.Add_Test_Routine
        (Routine => Assert_Response_Compliance'Access,
         Name    => "Assert response compliance");
   end Initialize;

end TKMRPC_Response_Tests;