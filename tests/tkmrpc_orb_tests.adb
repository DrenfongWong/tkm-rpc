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

with Interfaces.C.Strings;

with GNAT.OS_Lib;

with Anet.Util;
with Anet.Sockets.Unix;
with Anet.Receivers.Stream;

with Tkmrpc.Types;
with Tkmrpc.Clients.Ike;
with Tkmrpc.Dispatchers.Ike;
with Tkmrpc.Mock;
with Tkmrpc.Results;
with Tkmrpc.Process_Stream;

pragma Elaborate_All (Anet.Receivers.Stream);
pragma Elaborate_All (Tkmrpc.Process_Stream);

package body Tkmrpc_ORB_Tests
is
   use Ahven;
   use Tkmrpc;

   package ICS renames Interfaces.C.Strings;

   package Unix_TCP_Receiver is new Anet.Receivers.Stream
     (Socket_Type => Anet.Sockets.Unix.TCP_Socket_Type);

   procedure Dispatch is new Process_Stream
     (Dispatch => Tkmrpc.Dispatchers.Ike.Dispatch);

   Socket_Path : constant String := "/tmp/tkm.rpc-";

   -------------------------------------------------------------------------

   procedure C_Test_Client
   is
      use type Tkmrpc.Types.Nc_Id_Type;

      Sock     : aliased Anet.Sockets.Unix.TCP_Socket_Type;
      Receiver : Unix_TCP_Receiver.Receiver_Type (S => Sock'Access);
      Args     : GNAT.OS_Lib.Argument_List (1 .. 1);
      Success  : Boolean := False;
      Path     : constant String
        := Socket_Path & Anet.Util.Random_String (Len => 8);
   begin
      Sock.Init;
      Sock.Bind (Path => Anet.Sockets.Unix.Path_Type (Path));

      Receiver.Listen (Callback => Dispatch'Access);

      Args (1) := new String'(Path);
      GNAT.OS_Lib.Spawn (Program_Name => "./client",
                         Args         => Args,
                         Success      => Success);
      GNAT.OS_Lib.Free (X => Args (1));

      Assert (Condition => Success,
              Message   => "Spawning client failed");

      --  The C test client requests a nonce with id 1 and length 128.

      Assert (Condition => Mock.Last_Nonce_Id = 1,
              Message   => "Last nonce id mismatch");
      Assert (Condition => Mock.Last_Nonce_Length = 128,
              Message   => "Last nonce length mismatch");

      Receiver.Stop;
      Mock.Last_Nonce_Id     := Types.Nc_Id_Type'Last;
      Mock.Last_Nonce_Length := 16;

   exception
      when others =>
         Receiver.Stop;
         Mock.Last_Nonce_Id     := Types.Nc_Id_Type'Last;
         Mock.Last_Nonce_Length := 16;
         raise;
   end C_Test_Client;

   -------------------------------------------------------------------------

   procedure Client_Server_ORBs
   is
      use type Tkmrpc.Types.Nonce_Type;
      use type Tkmrpc.Types.Nc_Id_Type;

      Sock     : aliased Anet.Sockets.Unix.TCP_Socket_Type;
      Receiver : Unix_TCP_Receiver.Receiver_Type (S => Sock'Access);
      Nonce    : Types.Nonce_Type;
      Result   : Results.Result_Type;
      Path     : constant String
        := Socket_Path & Anet.Util.Random_String (Len => 8);
      Address  : ICS.chars_ptr
        := ICS.New_String (Str => Path);
   begin
      Sock.Init;
      Sock.Bind (Path => Anet.Sockets.Unix.Path_Type (Path));

      Receiver.Listen (Callback => Dispatch'Access);

      Clients.Ike.Init (Result  => Result,
                        Address => Address);
      ICS.Free (Item => Address);

      Assert (Condition => Result = Results.Ok,
              Message   => "IKE init failed");

      Clients.Ike.Nc_Create (Nc_Id        => 23,
                             Nonce_Length => 243,
                             Nonce        => Nonce,
                             Result       => Result);

      Assert (Condition => Result = Results.Ok,
              Message   => "Remote call failed");
      Assert (Condition => Nonce = Mock.Ref_Nonce,
              Message   => "Nonce incorrect");
      Assert (Condition => Mock.Last_Nonce_Id = 23,
              Message   => "Last nonce id mismatch");
      Assert (Condition => Mock.Last_Nonce_Length = 243,
              Message   => "Last nonce length mismatch");

      Receiver.Stop;
      Mock.Last_Nonce_Id     := Types.Nc_Id_Type'Last;
      Mock.Last_Nonce_Length := 16;

   exception
      when others =>
         Receiver.Stop;
         Mock.Last_Nonce_Id     := Types.Nc_Id_Type'Last;
         Mock.Last_Nonce_Length := 16;
         raise;
   end Client_Server_ORBs;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "ORB tests");
      T.Add_Test_Routine
        (Routine => Client_Server_ORBs'Access,
         Name    => "Client/server interaction");
      T.Add_Test_Routine
        (Routine => C_Test_Client'Access,
         Name    => "C test client");
   end Initialize;

end Tkmrpc_ORB_Tests;
