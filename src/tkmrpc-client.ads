with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Client
is

   procedure Connect (Address : String);
   --  Initialize RPC client package and connect to RPC server given by socket
   --  address.

   procedure Send (Data : Request.Data_Type);
   --  Send request data to server.

   procedure Receive (Data : out Response.Data_Type);
   --  Receive response data from server.

end TKMRPC.Client;
