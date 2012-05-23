with TKMRPC.Nonces;
with TKMRPC.Servers.IKE;

package TKMRPC.Mock
is
   type TKM_Type is new Servers.IKE.IKE_Interface with private;
   --  TKM implementation mock.

   overriding
   procedure Nc_Reset
     (Object   : TKM_Type;
      Nonce_Id : Nonces.Nonce_Id_Type) is null;
   --  Reset a NC context. Not implemented yet.

   overriding
   function Nc_Create
     (Object       : TKM_Type;
      Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type;
   --  Create a new nonce.

   Ref_Nonce : constant Nonces.Nonce_Type
     := (Value  => (others => Character'Pos ('f')),
         Length => 156);
   --  Reference nonce returned by Nc_Create function.

   Last_Nonce_Id     : Nonces.Nonce_Id_Type     := 0;
   Last_Nonce_Length : Nonces.Nonce_Length_Type := 16;
   --  Calls to Nc_Create will set these vars to the last requested nonce Id
   --  and length.

private

   type TKM_Type is new Servers.IKE.IKE_Interface with null record;

end TKMRPC.Mock;
