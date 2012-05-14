with TKMRPC.IKE;

package TKMRPC.Implementation
is

   procedure Register (Object : IKE.IKE_Access);
   --  Register TKM IKE implementation.

   function Get_Impl return IKE.IKE_Access;
   --  Return registered TKM IKE implementation.

   Implementation_Error : exception;

end TKMRPC.Implementation;
