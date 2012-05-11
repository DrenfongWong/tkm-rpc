with Interfaces.C;

with System;

with TKMRPC.Operations;
with TKMRPC.Response.Convert;

with Test_Utils;

package body TKMRPC_Response_Tests
is
   use Ahven;
   use TKMRPC;

   package IC renames Interfaces.C;

   function C_Assert_Response (Res : System.Address) return IC.int;
   pragma Import (C, C_Assert_Response, "assert_response");

   -------------------------------------------------------------------------

   procedure Assert_Response_Compliance
   is
      use type IC.int;
      use type TKMRPC.Operations.Operation_Type;
      use type TKMRPC.Response.Padded_Data_Type;

      My_Res   : Response.Data_Type        := Test_Utils.Test_Response;
      Ref_Data : Response.Padded_Data_Type := (others => Character'Pos ('d'));
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
      T.Add_Test_Routine
        (Routine => Stream_Conversion'Access,
         Name    => "To/from stream conversions");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Stream_Conversion
   is
      use TKMRPC.Response;
      use type TKMRPC.Operations.Operation_Type;
      use type TKMRPC.Response.Padded_Data_Type;

      Stream : constant Convert.Stream_Type
        := Convert.To_Stream (S => Test_Utils.Test_Response);
      Res    : constant Data_Type        := Convert.From_Stream (S => Stream);
      Data   : constant Padded_Data_Type := (others => Character'Pos ('c'));
   begin
      Assert (Condition => Res.Header.Operation = Test_Utils.Test_Operation,
              Message   => "Operation mismatch");
      Assert (Condition => Res.Header.Request_ID = 901213123123,
              Message   => "Request ID mismatch");
      Assert (Condition => Res.Padded_Data = Data,
              Message   => "Data mismatch");
   end Stream_Conversion;

end TKMRPC_Response_Tests;
