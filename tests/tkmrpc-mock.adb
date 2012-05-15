package body TKMRPC.Mock
is
   -------------------------------------------------------------------------

   function Nc_Create
     (Object       : TKM_Type;
      Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type
   is
      pragma Unreferenced (Object, Nonce_Id);
   begin
      return Nonces.Nonce_Type'
        (Value  => (others => Character'Pos ('f')),
         Length => Nonce_Length);
   end Nc_Create;

end TKMRPC.Mock;
