with Interfaces.C.Strings;

with GNAT.OS_Lib;

with Tkmrpc.Types;
with Tkmrpc.Clients.Ike;
with Tkmrpc.Dispatchers.Ike;
with Tkmrpc.Transport.Servers;
with Tkmrpc.Mock;
with Tkmrpc.Results;

with Test_Utils;

package body Tkmrpc_ORB_Tests
is
   use Ahven;
   use Tkmrpc;

   package ICS renames Interfaces.C.Strings;

   -------------------------------------------------------------------------

   procedure C_Test_Client
   is
      use type Tkmrpc.Types.Nc_Id_Type;

      RPC_Server : Transport.Servers.Server_Type;
      Args       : GNAT.OS_Lib.Argument_List (1 .. 0);
      Success    : Boolean := False;
   begin
      Transport.Servers.Listen
        (Server  => RPC_Server,
         Address => Test_Utils.Communication_Socket,
         Process => Dispatchers.Ike.Dispatch'Access);
      GNAT.OS_Lib.Spawn (Program_Name => "obj/test_client",
                         Args         => Args,
                         Success      => Success);
      Assert (Condition => Success,
              Message   => "Spawning client failed");

      --  The C test client requests a nonce with id 1 and length 128.

      Assert (Condition => Mock.Last_Nonce_Id = 1,
              Message   => "Last nonce id mismatch");
      Assert (Condition => Mock.Last_Nonce_Length = 128,
              Message   => "Last nonce length mismatch");

      Transport.Servers.Stop (Server => RPC_Server);
      Mock.Last_Nonce_Id     := 0;
      Mock.Last_Nonce_Length := 16;

   exception
      when others =>
         Transport.Servers.Stop (Server => RPC_Server);
         Mock.Last_Nonce_Id     := 0;
         Mock.Last_Nonce_Length := 16;
         raise;
   end C_Test_Client;

   -------------------------------------------------------------------------

   procedure Client_Server_ORBs
   is
      use type Tkmrpc.Types.Nonce_Type;
      use type Tkmrpc.Types.Nc_Id_Type;

      RPC_Server : Transport.Servers.Server_Type;
      Nonce      : Types.Nonce_Type;
      Result     : Results.Result_Type;
      Address    : ICS.chars_ptr
        := ICS.New_String (Str => Test_Utils.Communication_Socket);
   begin
      Transport.Servers.Listen
        (Server  => RPC_Server,
         Address => Test_Utils.Communication_Socket,
         Process => Dispatchers.Ike.Dispatch'Access);

      Clients.Ike.Init (Result  => Result,
                        Address => Address);
      ICS.Free (Item => Address);

      Assert (Condition => Result = Results.Ok,
              Message   => "IKE init failed");

      Clients.Ike.Nc_Create (Nc_Id        => 123,
                             Nonce_Length => 243,
                             Nonce        => Nonce,
                             Result       => Result);

      Assert (Condition => Result = Results.Ok,
              Message   => "Remote call failed");
      Assert (Condition => Nonce = Mock.Ref_Nonce,
              Message   => "Nonce incorrect");
      Assert (Condition => Mock.Last_Nonce_Id = 123,
              Message   => "Last nonce id mismatch");
      Assert (Condition => Mock.Last_Nonce_Length = 243,
              Message   => "Last nonce length mismatch");

      Transport.Servers.Stop (Server => RPC_Server);
      Mock.Last_Nonce_Id     := 0;
      Mock.Last_Nonce_Length := 16;

   exception
      when others =>
         Transport.Servers.Stop (Server => RPC_Server);
         Mock.Last_Nonce_Id     := 0;
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
