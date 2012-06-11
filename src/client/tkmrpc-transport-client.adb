with Ada.Streams;
with Ada.Strings.Unbounded;

with Anet.Sockets;

with TKMRPC.Request.Convert;
with TKMRPC.Response.Convert;

package body TKMRPC.Transport.Client
is

   Socket : Anet.Sockets.Socket_Type;

   -------------------------------------------------------------------------

   procedure Connect (Address : String)
   is
   begin
      Socket.Create
        (Family => Anet.Sockets.Family_Unix,
         Mode   => Anet.Sockets.Stream_Socket);
      Socket.Connect
        (Dst =>
           (Family => Anet.Sockets.Family_Unix,
            Path   => Ada.Strings.Unbounded.To_Unbounded_String
              (Address)));
   end Connect;

   -------------------------------------------------------------------------

   procedure Receive (Data : out Response.Data_Type)
   is
      Sender : Anet.Sockets.Socket_Addr_Type;
      Buffer : Ada.Streams.Stream_Element_Array (1 .. Response.Response_Size);
      Last   : Ada.Streams.Stream_Element_Offset;
   begin
      Socket.Receive
        (Src  => Sender,
         Item => Buffer,
         Last => Last);

      Data := Response.Convert.From_Stream (S => Buffer);
   end Receive;

   -------------------------------------------------------------------------

   procedure Send (Data : Request.Data_Type)
   is
   begin
      Socket.Send (Item => Request.Convert.To_Stream (S => Data));
   end Send;

end TKMRPC.Transport.Client;
