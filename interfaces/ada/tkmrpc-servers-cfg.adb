package body TKMRPC.Servers.CFG
is

   Instance : CFG_Handle;

   -------------------------------------------------------------------------

   function Get_Instance return CFG_Handle
   is
   begin
      if Instance = null then
         raise Implementation_Error with "No CFG implementation registered";
      end if;
      return Instance;
   end Get_Instance;

   -------------------------------------------------------------------------

   procedure Register (Object : CFG_Handle)
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

end TKMRPC.Servers.CFG;
