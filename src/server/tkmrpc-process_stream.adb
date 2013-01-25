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

with Tkmrpc.Request.Convert;
with Tkmrpc.Response.Convert;

procedure Tkmrpc.Process_Stream
  (Recv_Data :     Ada.Streams.Stream_Element_Array;
   Send_Data : out Ada.Streams.Stream_Element_Array;
   Send_Last : out Ada.Streams.Stream_Element_Offset)
is
   use type Ada.Streams.Stream_Element_Offset;

   Req : constant Tkmrpc.Request.Data_Type
     := Tkmrpc.Request.Convert.From_Stream (S => Recv_Data);
   Res : Tkmrpc.Response.Data_Type;
begin
   begin
      Dispatch (Req => Req,
                Res => Res);

   exception
      when E : others =>
         Res                   := Tkmrpc.Response.Null_Data;
         Res.Header.Operation  := Req.Header.Operation;
         Res.Header.Request_Id := Req.Header.Request_Id;
         Exception_Handler (Ex     => E,
                            Result => Res.Header.Result);
   end;

   Send_Last := Res'Size / 8;
   Send_Data (Send_Data'First .. Send_Last)
     := Tkmrpc.Response.Convert.To_Stream (S => Res);
end Tkmrpc.Process_Stream;
