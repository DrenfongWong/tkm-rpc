with Ada.Streams;
with Ada.Text_IO;

with Anet.Types;

with Tkmrpc.Request.Convert;
with Tkmrpc.Response.Convert;

package body Tkmrpc.Transport.Servers
is

   --  Placeholder callbacks needed for callback initialization.

   procedure Empty_Process_Cb
     (Req :    Request.Data_Type;
      Res : out Response.Data_Type) is null;

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
      Process_Cb : Op_Handler             := Empty_Process_Cb'Access;
      Error_Cb   : Error_Handler_Callback := Empty_Err_Cb'Access;
      Stop       : Boolean                := False;
   begin
      Setup_Loop :
      loop
         select
            accept Listen (Cb : Op_Handler)
            do
               Process_Cb := Cb;
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
         Main_Loop :
         loop
            Parent.Sock_Listen.Accept_Connection
              (New_Socket => Parent.Sock_Comm);

            Processing_Loop :
            loop
               declare
                  use type Ada.Streams.Stream_Element_Offset;

                  Buffer : Ada.Streams.Stream_Element_Array (1 .. 2048);
                  Last   : Ada.Streams.Stream_Element_Offset;
               begin
                  Parent.Sock_Comm.Receive (Item => Buffer,
                                            Last => Last);

                  --  Exit request processing loop on connection close.

                  exit Processing_Loop when Last = 0;

                  declare
                     Req : constant Request.Data_Type
                       := Request.Convert.From_Stream
                         (S => Buffer (Buffer'First .. Last));
                     Res : Response.Data_Type;
                  begin
                     Process_Cb (Req => Req,
                                 Res => Res);

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
                        exit Main_Loop;
                     end if;
               end;
            end loop Processing_Loop;
         end loop Main_Loop;
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
      Process :        Op_Handler)
   is
   begin
      Server.Sock_Listen.Init;
      Server.Sock_Listen.Bind (Path => Anet.Types.Unix_Path_Type (Address));
      Server.Sock_Listen.Listen;

      Server.Trigger.Activate;
      Server.C_Task.Listen (Cb => Process);
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

end Tkmrpc.Transport.Servers;
