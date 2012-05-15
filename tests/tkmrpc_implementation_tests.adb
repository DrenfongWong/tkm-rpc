with TKMRPC.IKE;
with TKMRPC.Nonces;
with TKMRPC.Implementation;

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
      Ref : IKE.IKE_Access;
   begin
      begin
         Ref := Implementation.Get_Impl;
         Fail (Message => "Exception expected");

      exception
         when Implementation.Implementation_Error => null;
      end;

      Implementation.Register (Object => Impl'Access);
      Ref := Implementation.Get_Impl;

      declare
         use type TKMRPC.Nonces.Nonce_Length_Type;

         Nonce : constant Nonces.Nonce_Type := Ref.Nc_Create
           (Nonce_Id     => 123,
            Nonce_Length => 233);
      begin
         Assert (Condition => Nonce.Length = 233,
                 Message   => "Length mismatch");
      end;
   end Register_Implementation;

end TKMRPC_Implementation_Tests;
