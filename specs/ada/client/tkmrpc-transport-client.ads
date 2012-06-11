with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Transport.Client is

   procedure Connect (Address : String);
   --  Connect to the RPC server given by socket address.

   procedure Send (Data : Request.Data_Type);
   --  Send request data to RPC server.

   procedure Receive (Data : out Response.Data_Type);
   --  Receive response data from RPC server.

end Tkmrpc.Transport.Client;
