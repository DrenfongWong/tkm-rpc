with Interfaces.C;

with System;

with TKMRPC.Request;
with TKMRPC.Operations;

package body TKMRPC_Request_Response_Tests is

   use Ahven;
   use TKMRPC;

   package IC renames Interfaces.C;

   function C_Assert_Request (Req : System.Address) return IC.int;
   pragma Import (C, C_Assert_Request, "assert_request");

   -------------------------------------------------------------------------

   procedure Assert_Request_Compliance
   is
      use type IC.int;
      use type Operations.Operation_Type;
      use type Request.Padded_Data_Type;

      My_Req   : Request.Request_Type
        := (Header =>
              (Operation  => TKMRPC.Operations.Nonce_Create,
               Request_ID => 234234234),
            Data   => (others => Character'Pos ('a')));
      Ref_Data : Request.Padded_Data_Type
        := (others => Character'Pos ('b'));
   begin
      My_Req.Data (Request.Padded_Data_Range'Last) := Character'Pos ('x');
      Assert (Condition => C_Assert_Request (Req => My_Req'Address) = 1,
              Message   => "Not C compliant");

      Ref_Data (Request.Padded_Data_Range'Last) := Character'Pos ('y');
      Assert (Condition => My_Req.Header.Operation = Operations.Nonce_Reset,
              Message   => "Operation mismatch");
      Assert (Condition => My_Req.Header.Request_ID = 896767676767612,
              Message   => "Request ID mismatch");
      Assert (Condition => My_Req.Data = Ref_Data,
              Message   => "Data mismatch");
   end Assert_Request_Compliance;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Request/Response tests");
      T.Add_Test_Routine
        (Routine => Assert_Request_Compliance'Access,
         Name    => "Assert request compliance");
   end Initialize;

end TKMRPC_Request_Response_Tests;
