with TKMRPC.Nonces;
with TKMRPC.IKE;

package TKMRPC.Mock
is
   type TKM_Type is new IKE.IKE_Interface with private;
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

private

   type TKM_Type is new IKE.IKE_Interface with null record;

end TKMRPC.Mock;
