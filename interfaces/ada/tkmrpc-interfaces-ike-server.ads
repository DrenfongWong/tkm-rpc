with TKMRPC.Nonces;

package TKMRPC.Interfaces.IKE.Server
is
   type IKE_Interface is interface;
   --  The TKM - IKE interface

   type IKE_Access is access all IKE_Interface'Class;

   procedure Nc_Reset
     (Object   : IKE_Interface;
      Nonce_Id : Nonces.Nonce_Id_Type) is abstract;
   --  Reset a NC context.

   function Nc_Create
     (Object       : IKE_Interface;
      Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type
      is abstract;
   --  Create a nonce.

end TKMRPC.Interfaces.IKE.Server;
