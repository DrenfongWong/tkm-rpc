with Ada.Streams;

with Anet.Sockets.Unix;

with Tkmrpc.Request.Convert;
with Tkmrpc.Response.Convert;

package body Tkmrpc.Transport.Client
is

   Socket : Anet.Sockets.Unix.TCP_Socket_Type;

   -------------------------------------------------------------------------

   procedure Connect (Address : String)
   is
   begin
      Socket.Init;
      Socket.Connect (Path => Anet.Sockets.Unix.Path_Type (Address));
   end Connect;

   -------------------------------------------------------------------------

   procedure Receive (Data : out Response.Data_Type)
   is
      Buffer : Ada.Streams.Stream_Element_Array (1 .. Response.Response_Size);
      Last   : Ada.Streams.Stream_Element_Offset;
   begin
      Socket.Receive
        (Item => Buffer,
         Last => Last);

      Data := Response.Convert.From_Stream (S => Buffer);
   end Receive;

   -------------------------------------------------------------------------

   procedure Send (Data : Request.Data_Type)
   is
   begin
      Socket.Send (Item => Request.Convert.To_Stream (S => Data));
   end Send;

end Tkmrpc.Transport.Client;
