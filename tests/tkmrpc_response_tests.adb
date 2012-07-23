with Tkmrpc.Operations;
with Tkmrpc.Response.Convert;

with Test_Utils;

package body Tkmrpc_Response_Tests
is
   use Ahven;
   use Tkmrpc;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Response tests");
      T.Add_Test_Routine
        (Routine => Stream_Conversion'Access,
         Name    => "To/from stream conversions");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Stream_Conversion
   is
      use Tkmrpc.Response;
      use type Tkmrpc.Operations.Operation_Type;
      use type Tkmrpc.Response.Padded_Data_Type;

      Stream : constant Convert.Stream_Type
        := Convert.To_Stream (S => Test_Utils.Test_Response);
      Res    : constant Data_Type        := Convert.From_Stream (S => Stream);
      Data   : constant Padded_Data_Type := (others => Character'Pos ('c'));
   begin
      Assert (Condition => Res.Header.Operation = Test_Utils.Test_Operation,
              Message   => "Operation mismatch");
      Assert (Condition => Res.Header.Request_Id = 234234234,
              Message   => "Request ID mismatch");
      Assert (Condition => Res.Padded_Data = Data,
              Message   => "Data mismatch");
   end Stream_Conversion;

end Tkmrpc_Response_Tests;
