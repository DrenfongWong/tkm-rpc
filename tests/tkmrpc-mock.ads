with Tkmrpc.Types;

package Tkmrpc.Mock
is

   Ref_Nonce : constant Types.Nonce_Type
     := (Size => 156,
         Data => (others => Character'Pos ('f')));
   --  Reference nonce returned by Nc_Create function.

   Last_Nonce_Id     : Types.Nc_Id_Type        := 0;
   Last_Nonce_Length : Types.Nonce_Length_Type := 16;
   --  Calls to Nc_Create will set these vars to the last requested nonce Id
   --  and length.

   Ref_Dh_Pubvalue : constant Types.Dh_Pubvalue_Type
     := (Size => 8,
         Data => (others => 16#3b#));
   --  Reference Diffie-Hellman public value checked in Dh_Generate_Key
   --  procedure.

end Tkmrpc.Mock;
