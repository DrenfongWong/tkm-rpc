with Ada.Streams;
with Ada.Text_IO;
with Ada.Exceptions;

with TKMRPC.Request.Convert;
with TKMRPC.Response.Convert;

package body TKMRPC.Servers
is

   --  Placeholder callbacks needed for request/response callback
   --  initialization.

   procedure Empty_Recv_Cb (Data : Request.Data_Type) is null;
   procedure Empty_Resp_Cb (Data : out Response.Data_Type) is null;

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
      Recv_Cb : Request_Callback  := Empty_Recv_Cb'Access;
      Resp_Cb : Response_Callback := Empty_Resp_Cb'Access;
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
            terminate;
         end select;
      end loop Setup_Loop;

      select
         Parent.Trigger.Stop;
      then abort
         Parent.Sock_Listen.Accept_Connection
           (New_Socket => Parent.Sock_Comm);
         Reception_Loop :
         loop
            declare
               Sender : Anet.Sockets.Socket_Addr_Type
                 (Family => Anet.Sockets.Family_Unix);
               Buffer : Ada.Streams.Stream_Element_Array (1 .. 2048);
               Last   : Ada.Streams.Stream_Element_Offset;
            begin
               Parent.Sock_Comm.Receive (Src  => Sender,
                                         Item => Buffer,
                                         Last => Last);

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
               when E : others =>
                  Ada.Text_IO.Put_Line
                    (Ada.Exceptions.Exception_Information (E));
            end;
         end loop Reception_Loop;
      end select;
      Parent.Trigger.Signal_Termination;
   end Connection_Task;

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

   procedure Stop (Server : in out Server_Type)
   is
   begin
      Server.Trigger.Shutdown;
      Server.Trigger.Wait_For_Termination;
   end Stop;

end TKMRPC.Servers;
