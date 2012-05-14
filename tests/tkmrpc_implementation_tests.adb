with TKMRPC.IKE;
with TKMRPC.Nonces;
with TKMRPC.Implementation;

package body TKMRPC_Implementation_Tests
is
   use Ahven;
   use TKMRPC;

   type Test_Impl_Type is new IKE.IKE_Interface with null record;
   --  TKM test implementation.

   overriding
   procedure Nc_Reset
     (Object : Test_Impl_Type;
      Nc_Id  : Nonces.Nonce_Id_Type) is null;
   --  Reset a NC context.

   overriding
   function Nc_Create
     (Object       : Test_Impl_Type;
      Nc_Id        : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type;
   --  Create a test nonce.

   Impl : aliased Test_Impl_Type;
   --  TKM test instance.

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

   function Nc_Create
     (Object       : Test_Impl_Type;
      Nc_Id        : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type
   is
      pragma Unreferenced (Object, Nc_Id);
   begin
      return Nonces.Nonce_Type'
        (Value  => (others => Character'Pos ('f')),
         Length => Nonce_Length);
   end Nc_Create;

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
           (Nc_Id        => 123,
            Nonce_Length => 233);
      begin
         Assert (Condition => Nonce.Length = 233,
                 Message   => "Length mismatch");
      end;
   end Register_Implementation;

end TKMRPC_Implementation_Tests;
