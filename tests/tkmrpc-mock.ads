with TKMRPC.Types;

package TKMRPC.Mock
is

   Ref_Nonce : constant Types.nonce_type
     := (Size => 156,
         Data => (others => Character'Pos ('f')));
   --  Reference nonce returned by Nc_Create function.

   Last_Nonce_Id     : Types.nc_id_type        := 0;
   Last_Nonce_Length : Types.nonce_length_type := 16;
   --  Calls to Nc_Create will set these vars to the last requested nonce Id
   --  and length.

end TKMRPC.Mock;
