with TKMRPC.Servers.IKE;

package TKMRPC.Implementation
is

   procedure Register (Object : Servers.IKE.IKE_Handle);
   --  Register TKM IKE implementation.

   procedure Unregister;
   --  Unregister current TKM IKE implementation;

   function Get_Impl return Servers.IKE.IKE_Handle;
   --  Return registered TKM IKE implementation.

   Implementation_Error : exception;

end TKMRPC.Implementation;
