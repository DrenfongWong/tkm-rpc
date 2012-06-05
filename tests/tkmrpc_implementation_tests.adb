with TKMRPC.Types;
with TKMRPC.Implementation;
with TKMRPC.Servers.IKE;
with TKMRPC.Results;

with TKMRPC.Mock;

package body TKMRPC_Implementation_Tests
is
   use Ahven;
   use TKMRPC;

   Impl : aliased Mock.TKM_Type;
   --  TKM mock instance.

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Implementation registry tests");
      T.Add_Test_Routine
        (Routine => Register_Implementation'Access,
         Name    => "Register TKM implementation");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Register_Implementation
   is
      Ref : Servers.IKE.IKE_Handle;
   begin
      begin
         Ref := Implementation.Get_Impl;
         Fail (Message => "Exception expected (1)");

      exception
         when Implementation.Implementation_Error => null;
      end;

      Implementation.Register (Object => Impl'Access);
      Ref := Implementation.Get_Impl;

      declare
         use type TKMRPC.Types.nonce_type;
         use type TKMRPC.Results.Result_Type;

         Nonce  : Types.nonce_type;
         Result : Results.Result_Type;
      begin
         Ref.nc_create (nc_id        => 123,
                        nonce_length => 233,
                        nonce        => Nonce,
                        Result       => Result);
         Assert (Condition => Result = Results.OK,
                 Message   => "Result not OK");
         Assert (Condition => Nonce = Mock.Ref_Nonce,
                 Message   => "Nonce incorrect");
      end;

      Implementation.Unregister;
      begin
         Ref := Implementation.Get_Impl;
         Fail (Message => "Exception expected (2)");

      exception
         when Implementation.Implementation_Error => null;
      end;
   end Register_Implementation;

end TKMRPC_Implementation_Tests;
