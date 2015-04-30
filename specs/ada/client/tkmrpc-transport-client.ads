with Tkmrpc.Request;
with Tkmrpc.Response;

package Tkmrpc.Transport.Client is

   procedure Connect (Address : String);
   --  Connect to the RPC server given by socket address.

   procedure Send_Receive
     (Req_Data : Request.Data_Type;
      Res_Data : out Response.Data_Type);
   --  Send request data to RPC server and return response data.

end Tkmrpc.Transport.Client;
