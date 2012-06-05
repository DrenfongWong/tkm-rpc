with TKMRPC.Operations;
with TKMRPC.Response.Convert;

with Test_Utils;

package body TKMRPC_Response_Tests
is
   use Ahven;
   use TKMRPC;

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
