with Ada.Streams;

with Interfaces.C.Strings;

with GNAT.OS_Lib;

with Anet.Types;
with Anet.Util;
with Anet.Sockets.Unix;
with Anet.Receivers.Stream;

with Tkmrpc.Types;
with Tkmrpc.Clients.Ike;
with Tkmrpc.Request.Convert;
with Tkmrpc.Response.Convert;
with Tkmrpc.Dispatchers.Ike;
with Tkmrpc.Mock;
with Tkmrpc.Results;

pragma Elaborate_All (Anet.Receivers.Stream);

package body Tkmrpc_ORB_Tests
is
   use Ahven;
   use Tkmrpc;

   package ICS renames Interfaces.C.Strings;

   package Unix_TCP_Receiver is new Anet.Receivers.Stream
     (Socket_Type => Anet.Sockets.Unix.TCP_Socket_Type);

   Socket_Path : constant String := "/tmp/tkm.rpc-";

   procedure Dispatch_Ike_Request
     (Recv_Data :     Ada.Streams.Stream_Element_Array;
      Send_Data : out Ada.Streams.Stream_Element_Array;
      Send_Last : out Ada.Streams.Stream_Element_Offset);
   --  Convert given data to Tkmrpc request/response objects and pass them on
   --  to the Tkmrpc IKE dispatcher.

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
      Sock.Bind (Path => Anet.Types.Unix_Path_Type (Path));

      Receiver.Listen (Callback => Dispatch_Ike_Request'Access);

      Args (1) := new String'(Path);
      GNAT.OS_Lib.Spawn (Program_Name => "obj/test_client",
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
      Sock.Bind (Path => Anet.Types.Unix_Path_Type (Path));

      Receiver.Listen (Callback => Dispatch_Ike_Request'Access);

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

   procedure Dispatch_Ike_Request
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
         Tkmrpc.Dispatchers.Ike.Dispatch (Req => Req,
                                          Res => Res);

      exception
         when others =>
            Res                   := Tkmrpc.Response.Null_Data;
            Res.Header.Request_Id := Req.Header.Request_Id;
      end;

      Send_Last := Res'Size / 8;
      Send_Data (Send_Data'First .. Send_Last)
        := Tkmrpc.Response.Convert.To_Stream (S => Res);
   end Dispatch_Ike_Request;

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
