package body TKMRPC.Implementation
is

   Impl : IKE.IKE_Access;

   -------------------------------------------------------------------------

   function Get_Impl return IKE.IKE_Access
   is
      use type TKMRPC.IKE.IKE_Access;
   begin
      if Impl = null then
         raise Implementation_Error with "No implementation registered";
      end if;

      return Impl;
   end Get_Impl;

   -------------------------------------------------------------------------

   procedure Register (Object : IKE.IKE_Access)
   is
   begin
      Impl := Object;
   end Register;

end TKMRPC.Implementation;