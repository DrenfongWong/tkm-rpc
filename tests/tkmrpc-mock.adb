package body TKMRPC.Mock
is
   -------------------------------------------------------------------------

   procedure nc_create
     (Object       :     TKM_Type;
      Nonce_Id     :     Types.nc_id_type;
      Nonce_Length :     Types.nonce_length_type;
      Nonce        : out Types.nonce_type;
      Result       : out Results.Result_Type)
   is
      pragma Unreferenced (Object);
   begin
      Last_Nonce_Id     := Nonce_Id;
      Last_Nonce_Length := Nonce_Length;

      Nonce  := Ref_Nonce;
      Result := Results.OK;
   end nc_create;

end TKMRPC.Mock;
