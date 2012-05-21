with TKMRPC.Nonces;

package TKMRPC.Client
is
   procedure Init;
   pragma Export (C, Init, "tkm_init");
   --  Init client ORB.

   procedure Nc_Reset (Nonce_Id : Nonces.Nonce_Id_Type);
   pragma Export (C, Nc_Reset, "tkm_nc_reset");
   --  Reset a NC context.

   function Nc_Create
     (Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type;
   pragma Export (C, Nc_Create, "tkm_nc_create");
   --  Create a nonce.

   RPC_Error : exception;

end TKMRPC.Client;
