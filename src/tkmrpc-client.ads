with TKMRPC.Nonces;
with TKMRPC.Interfaces.IKE.Server;

package TKMRPC.Client
is
   type IKE_Type is new Interfaces.IKE.Server.IKE_Interface with private;
   --  TKM IKE client ORB.

   procedure Init (Object : in out IKE_Type);
   --  Initialize the TKM IKE ORB.

   overriding
   procedure Nc_Reset
     (Object   : IKE_Type;
      Nonce_Id : Nonces.Nonce_Id_Type) is null;
   --  Reset a NC context. Not implemented yet.

   overriding
   function Nc_Create
     (Object       : IKE_Type;
      Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type;
   --  Create a new nonce.

   RPC_Error : exception;

private

   type IKE_Type is new Interfaces.IKE.Server.IKE_Interface with null record;

end TKMRPC.Client;
