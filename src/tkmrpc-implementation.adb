package body TKMRPC.Implementation
is

   Impl : Servers.IKE.IKE_Handle;

   -------------------------------------------------------------------------

   function Get_Impl return Servers.IKE.IKE_Handle
   is
      use type TKMRPC.Servers.IKE.IKE_Handle;
   begin
      if Impl = null then
         raise Implementation_Error with "No implementation registered";
      end if;

      return Impl;
   end Get_Impl;

   -------------------------------------------------------------------------

   procedure Register (Object : Servers.IKE.IKE_Handle)
   is
   begin
      Impl := Object;
   end Register;

   -------------------------------------------------------------------------

   procedure Unregister
   is
   begin
      Impl := null;
   end Unregister;

end TKMRPC.Implementation;
