package body TKMRPC.Mock
is
   -------------------------------------------------------------------------

   function Nc_Create
     (Object       : TKM_Type;
      Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type
   is
      pragma Unreferenced (Object);
   begin
      Last_Nonce_Id     := Nonce_Id;
      Last_Nonce_Length := Nonce_Length;
      return Ref_Nonce;
   end Nc_Create;

end TKMRPC.Mock;
