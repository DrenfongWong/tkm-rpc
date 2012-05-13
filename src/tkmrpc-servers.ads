with Anet.Sockets;

with TKMRPC.Request;
with TKMRPC.Response;

package TKMRPC.Servers
is

   type Request_Callback is not null access procedure
     (Data : Request.Data_Type);
   --  Request callback responsible to handle request from client.

   type Response_Callback is not null access procedure
     (Data : out Response.Data_Type);
   --  Response callback used to send response to client.

   type Server_Type is limited private;
   --  TKM RPC server.

   procedure Listen
     (Server  : in out Server_Type;
      Address :        String;
      Receive :        Request_Callback;
      Respond :        Response_Callback);
   --  Initialize and start RPC server. The server will listen on the given
   --  socket address for client requests. An incoming request is dispatched to
   --  the specified request callback, the reponse callback is in charge of
   --  response data creation.

   procedure Stop (Server : in out Server_Type);
   --  Stop RPC server.

private

   task type Connection_Task (Parent : not null access Server_Type)
   is

      entry Listen
        (Request  : Request_Callback;
         Response : Response_Callback);
      --  Start listening for request data on parent's socket. The request
      --  callback procedure is called upon reception of a request. The given
      --  response callback is in charge of response data creation.

   end Connection_Task;

   protected type Trigger_Type
   is

      procedure Activate;
      --  Activate trigger.

      procedure Shutdown;
      --  Signal shutdown to all tasks waiting on the Stop entry.

      entry Stop;
      --  Entry used for listener ATC.

      procedure Signal_Termination;
      --  Signal termination to all tasks waiting on the Wait_For_Termination
      --  entry.

      entry Wait_For_Termination;
      --  Wait until termination is signaled.

   private
      Shutdown_Requested : Boolean := False;
      Is_Terminated      : Boolean := True;
   end Trigger_Type;

   type Server_Type is limited record
      Sock_Listen : Anet.Sockets.Socket_Type;
      Sock_Comm   : Anet.Sockets.Socket_Type;
      Trigger     : Trigger_Type;
      C_Task      : Connection_Task (Parent => Server_Type'Access);
   end record;

end TKMRPC.Servers;
