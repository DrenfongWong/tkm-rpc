with TKMRPC.Nonces;
with TKMRPC.Interfaces.IKE.Server;

package TKMRPC.Mock
is
   type TKM_Type is new Interfaces.IKE.Server.IKE_Interface with private;
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

private

   type TKM_Type is new Interfaces.IKE.Server.IKE_Interface with null record;

end TKMRPC.Mock;
