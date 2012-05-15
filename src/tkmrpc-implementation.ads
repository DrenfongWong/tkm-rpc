with TKMRPC.Interfaces.IKE.Server;

package TKMRPC.Implementation
is

   procedure Register (Object : Interfaces.IKE.Server.IKE_Access);
   --  Register TKM IKE implementation.

   procedure Unregister;
   --  Unregister current TKM IKE implementation;

   function Get_Impl return Interfaces.IKE.Server.IKE_Access;
   --  Return registered TKM IKE implementation.

   Implementation_Error : exception;

end TKMRPC.Implementation;
