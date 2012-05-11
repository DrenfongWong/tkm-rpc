with Interfaces.C;

with System;

with TKMRPC.Operations;
with TKMRPC.Request.Convert;

with Test_Utils;

package body TKMRPC_Request_Tests
is
   use Ahven;
   use TKMRPC;

   package IC renames Interfaces.C;

   function C_Assert_Request (Req : System.Address) return IC.int;
   pragma Import (C, C_Assert_Request, "assert_request");

   -------------------------------------------------------------------------

   procedure Assert_Request_Compliance
   is
      use type IC.int;
      use type TKMRPC.Operations.Operation_Type;
      use type TKMRPC.Request.Padded_Data_Type;

      My_Req   : Request.Data_Type        := Test_Utils.Test_Request;
      Ref_Data : Request.Padded_Data_Type := (others => Character'Pos ('b'));
   begin
      My_Req.Padded_Data (Request.Padded_Data_Range'Last)
        := Character'Pos ('x');
      Assert (Condition => C_Assert_Request (Req => My_Req'Address) = 1,
              Message   => "Not C compliant");

      Ref_Data (Request.Padded_Data_Range'Last) := Character'Pos ('y');
      Assert (Condition => My_Req.Header.Operation = Operations.Nonce_Reset,
              Message   => "Operation mismatch");
      Assert (Condition => My_Req.Header.Request_ID = 896767676767612,
              Message   => "Request ID mismatch");
      Assert (Condition => My_Req.Padded_Data = Ref_Data,
              Message   => "Data mismatch");
   end Assert_Request_Compliance;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Request tests");
      T.Add_Test_Routine
        (Routine => Assert_Request_Compliance'Access,
         Name    => "Assert request compliance");
      T.Add_Test_Routine
        (Routine => Stream_Conversion'Access,
         Name    => "To/from stream conversions");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Stream_Conversion
   is
      use TKMRPC.Request;
      use type TKMRPC.Operations.Operation_Type;
      use type TKMRPC.Request.Padded_Data_Type;

      Stream : constant Convert.Stream_Type
        := Convert.To_Stream (S => Test_Utils.Test_Request);
      Req    : constant Data_Type        := Convert.From_Stream (S => Stream);
      Data   : constant Padded_Data_Type := (others => Character'Pos ('a'));
   begin
      Assert (Condition => Req.Header.Operation = Operations.Nonce_Create,
              Message   => "Operation mismatch");
      Assert (Condition => Req.Header.Request_ID = 234234234,
              Message   => "Request ID mismatch");
      Assert (Condition => Req.Padded_Data = Data,
              Message   => "Data mismatch");
   end Stream_Conversion;

end TKMRPC_Request_Tests;
