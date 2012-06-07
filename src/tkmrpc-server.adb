with TKMRPC.Operations.IKE;
with TKMRPC.Operation_Dispatcher;

with TKMRPC.Operation_Handlers.IKE.nc_create;

package body TKMRPC.Server
is

   -------------------------------------------------------------------------

   procedure Start (TKM : Servers.IKE.IKE_Handle)
   is
   begin
      Servers.IKE.Register (Object => TKM);
      Operation_Dispatcher.Register
        (Handler => Operation_Handlers.IKE.nc_create.Handle'Access,
         Opcode  => Operations.IKE.nc_create);
      Operation_Dispatcher.Start;
   end Start;

   -------------------------------------------------------------------------

   procedure Stop
   is
   begin
      Operation_Dispatcher.Stop;
      Operation_Dispatcher.Clear;
      Servers.IKE.Unregister;
   end Stop;

end TKMRPC.Server;
