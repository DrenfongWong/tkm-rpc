package body TKMRPC.Implementation
is

   Impl : Interfaces.IKE.Server.IKE_Access;

   -------------------------------------------------------------------------

   function Get_Impl return Interfaces.IKE.Server.IKE_Access
   is
      use type TKMRPC.Interfaces.IKE.Server.IKE_Access;
   begin
      if Impl = null then
         raise Implementation_Error with "No implementation registered";
      end if;

      return Impl;
   end Get_Impl;

   -------------------------------------------------------------------------

   procedure Register (Object : Interfaces.IKE.Server.IKE_Access)
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
