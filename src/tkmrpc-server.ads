with TKMRPC.IKE;

package TKMRPC.Server
is
   procedure Start (TKM : IKE.IKE_Access);
   --  Start the server using the given TKM implementation.

   procedure Stop;
   --  Stop the TKM server.

end TKMRPC.Server;
