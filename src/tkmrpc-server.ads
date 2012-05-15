with TKMRPC.Interfaces.IKE.Server;

package TKMRPC.Server
is
   procedure Start (TKM : Interfaces.IKE.Server.IKE_Access);
   --  Start the server using the given TKM implementation.

   procedure Stop;
   --  Stop the TKM server.

end TKMRPC.Server;
