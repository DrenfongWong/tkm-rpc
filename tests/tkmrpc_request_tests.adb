with Tkmrpc.Operations;
with Tkmrpc.Request.Convert;

with Test_Utils;

package body Tkmrpc_Request_Tests
is
   use Ahven;
   use Tkmrpc;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Request tests");
      T.Add_Test_Routine
        (Routine => Stream_Conversion'Access,
         Name    => "To/from stream conversions");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Stream_Conversion
   is
      use Tkmrpc.Request;
      use type Tkmrpc.Operations.Operation_Type;
      use type Tkmrpc.Request.Padded_Data_Type;

      Stream : constant Convert.Stream_Type
        := Convert.To_Stream (S => Test_Utils.Test_Request);
      Req    : constant Data_Type        := Convert.From_Stream (S => Stream);
      Data   : constant Padded_Data_Type := (others => Character'Pos ('a'));
   begin
      Assert (Condition => Req.Header.Operation = Test_Utils.Test_Operation,
              Message   => "Operation mismatch");
      Assert (Condition => Req.Header.Request_Id = 234234234,
              Message   => "Request ID mismatch");
      Assert (Condition => Req.Padded_Data = Data,
              Message   => "Data mismatch");
   end Stream_Conversion;

end Tkmrpc_Request_Tests;
