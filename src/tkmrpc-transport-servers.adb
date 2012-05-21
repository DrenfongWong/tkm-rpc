with Ada.Streams;
with Ada.Text_IO;

with TKMRPC.Request.Convert;
with TKMRPC.Response.Convert;

package body TKMRPC.Transport.Servers
is

   --  Placeholder callbacks needed for request/response callback
   --  initialization.

   procedure Empty_Recv_Cb (Data : Request.Data_Type) is null;
   procedure Empty_Resp_Cb (Data : out Response.Data_Type) is null;
   procedure Empty_Err_Cb
     (E         :        Ada.Exceptions.Exception_Occurrence;
      Stop_Flag : in out Boolean) is null;

   -------------------------------------------------------------------------

   protected body Trigger_Type
   is

      ----------------------------------------------------------------------

      procedure Activate
      is
      begin
         Is_Terminated := False;
      end Activate;

      ----------------------------------------------------------------------

      function Is_Listening return Boolean
      is
      begin
         return not Is_Terminated;
      end Is_Listening;

      ----------------------------------------------------------------------

      procedure Shutdown
      is
      begin
         Shutdown_Requested := True;
      end Shutdown;

      ----------------------------------------------------------------------

      procedure Signal_Termination
      is
      begin
         Is_Terminated := True;
      end Signal_Termination;

      ----------------------------------------------------------------------

      entry Stop when Shutdown_Requested
      is
      begin
         null;
      end Stop;

      ----------------------------------------------------------------------

      entry Wait_For_Termination when Is_Terminated
      is
      begin
         null;
      end Wait_For_Termination;

   end Trigger_Type;

   -------------------------------------------------------------------------

   task body Connection_Task
   is
      Recv_Cb  : Request_Callback       := Empty_Recv_Cb'Access;
      Resp_Cb  : Response_Callback      := Empty_Resp_Cb'Access;
      Error_Cb : Error_Handler_Callback := Empty_Err_Cb'Access;
      Stop     : Boolean                := False;
   begin
      Setup_Loop :
      loop
         select
            accept Listen
              (Request  : Request_Callback;
               Response : Response_Callback)
            do
               Recv_Cb := Request;
               Resp_Cb := Response;
            end Listen;

            exit Setup_Loop;
         or
            accept Set_Error_Handler (Cb : Error_Handler_Callback)
            do
               Error_Cb := Cb;
            end Set_Error_Handler;
         or
            terminate;
         end select;
      end loop Setup_Loop;

      select
         Parent.Trigger.Stop;
      then abort
         Parent.Sock_Listen.Accept_Connection
           (New_Socket => Parent.Sock_Comm);

         Processing_Loop :
         loop
            declare
               use type Ada.Streams.Stream_Element_Offset;

               Sender : Anet.Sockets.Socket_Addr_Type
                 (Family => Anet.Sockets.Family_Unix);
               Buffer : Ada.Streams.Stream_Element_Array (1 .. 2048);
               Last   : Ada.Streams.Stream_Element_Offset;
            begin
               Parent.Sock_Comm.Receive (Src  => Sender,
                                         Item => Buffer,
                                         Last => Last);

               --  Exit request processing loop on connection close.

               exit Processing_Loop when Last = 0;

               declare
                  Req : constant Request.Data_Type
                    := Request.Convert.From_Stream
                      (S => Buffer (Buffer'First .. Last));
                  Res : Response.Data_Type;
               begin
                  Recv_Cb (Data => Req);
                  Resp_Cb (Data => Res);

                  Parent.Sock_Comm.Send
                    (Item => Response.Convert.To_Stream (S => Res));
               end;

            exception
               when Ex : others =>
                  Ada.Text_IO.Put_Line ("Exception in RPC transport");
                  Ada.Text_IO.Put_Line
                    (Ada.Exceptions.Exception_Information (X => Ex));
                  Error_Cb (E         => Ex,
                            Stop_Flag => Stop);
                  if Stop then
                     exit Processing_Loop;
                  end if;
            end;
         end loop Processing_Loop;
      end select;

      Parent.Trigger.Signal_Termination;
   end Connection_Task;

   -------------------------------------------------------------------------

   function Is_Listening (Server : Server_Type) return Boolean
   is
   begin
      return Server.Trigger.Is_Listening;
   end Is_Listening;

   -------------------------------------------------------------------------

   procedure Listen
     (Server  : in out Server_Type;
      Address :        String;
      Receive :        Request_Callback;
      Respond :        Response_Callback)
   is
   begin
      Server.Sock_Listen.Create
        (Family => Anet.Sockets.Family_Unix,
         Mode   => Anet.Sockets.Stream_Socket);
      Server.Sock_Listen.Bind_Unix
        (Path => Anet.Sockets.Unix_Path_Type (Address));
      Server.Sock_Listen.Listen;

      Server.Trigger.Activate;
      Server.C_Task.Listen (Request  => Receive,
                            Response => Respond);
   end Listen;

   -------------------------------------------------------------------------

   procedure Register_Error_Handler
     (Server   : in out Server_Type;
      Callback :        Error_Handler_Callback)
   is
   begin
      Server.C_Task.Set_Error_Handler (Cb => Callback);
   end Register_Error_Handler;

   -------------------------------------------------------------------------

   procedure Stop (Server : in out Server_Type)
   is
   begin
      Server.Trigger.Shutdown;
      Server.Trigger.Wait_For_Termination;
   end Stop;

end TKMRPC.Transport.Servers;
