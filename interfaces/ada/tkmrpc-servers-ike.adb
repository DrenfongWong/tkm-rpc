package body TKMRPC.Servers.IKE
is

   Instance : IKE_Handle;

   -------------------------------------------------------------------------

   function Get_Instance return IKE_Handle
   is
   begin
      if Instance = null then
         raise Implementation_Error with "No IKE implementation registered";
      end if;

      return Instance;
   end Get_Instance;

   -------------------------------------------------------------------------

   procedure Register (Object : IKE_Handle)
   is
   begin
      Instance := Object;
   end Register;

   -------------------------------------------------------------------------

   procedure Unregister
   is
   begin
      Instance := null;
   end Unregister;

end TKMRPC.Servers.IKE;
