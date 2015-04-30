--
--  Copyright (C) 2013 Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2013 Adrian-Ken Rueegsegger <ken@codelabs.ch>
--  All rights reserved.
--
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above copyright
--     notice, this list of conditions and the following disclaimer in the
--     documentation and/or other materials provided with the distribution.
--  3. Neither the name of the University nor the names of its contributors
--     may be used to endorse or promote products derived from this software
--     without specific prior written permission.
--
--  THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
--  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
--  ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
--  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
--  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
--  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
--  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
--  SUCH DAMAGE.
--

with Ada.Streams;

with Anet.Sockets.Unix;

with Tkmrpc.Request.Convert;
with Tkmrpc.Response.Convert;

package body Tkmrpc.Transport.Client
is

   --  This socket type serializes access to the communication socket.
   protected type Serialized_Socket
   is

      --  Connect socket to given address.
      procedure Connect (Address : String);

      --  Send request data and return received response.
      procedure Send_Receive
        (Req_Data :     Request.Data_Type;
         Res_Data : out Response.Data_Type);

   private

      --  Socket used for communication with server.
      Socket : Anet.Sockets.Unix.TCP_Socket_Type;

   end Serialized_Socket;

   Sock : Serialized_Socket;

   -------------------------------------------------------------------------

   procedure Connect (Address : String)
   is
   begin
      Sock.Connect (Address => Address);
   end Connect;

   -------------------------------------------------------------------------

   procedure Send_Receive
     (Req_Data :     Request.Data_Type;
      Res_Data : out Response.Data_Type)
   is
   begin
      Sock.Send_Receive (Req_Data => Req_Data,
                         Res_Data => Res_Data);
   end Send_Receive;

   -------------------------------------------------------------------------

   protected body Serialized_Socket
   is

      ----------------------------------------------------------------------

      procedure Connect (Address : String)
      is
      begin
         Socket.Init;
         Socket.Connect (Path => Anet.Sockets.Unix.Path_Type (Address));
      end Connect;

      ----------------------------------------------------------------------

      procedure Send_Receive
        (Req_Data :     Request.Data_Type;
         Res_Data : out Response.Data_Type)
      is
         Buffer : Ada.Streams.Stream_Element_Array
           (1 .. Response.Response_Size);
         Last   : Ada.Streams.Stream_Element_Offset;
      begin
         Socket.Send (Item => Request.Convert.To_Stream (S => Req_Data));
         Socket.Receive
           (Item => Buffer,
            Last => Last);

         Res_Data := Response.Convert.From_Stream (S => Buffer);
      end Send_Receive;

   end Serialized_Socket;

end Tkmrpc.Transport.Client;
