with Interfaces.C.Strings;

with GNAT.OS_Lib;

with TKMRPC.Types;
with TKMRPC.Clients.IKE;
with TKMRPC.Dispatchers.IKE;
with TKMRPC.Transport.Servers;
with TKMRPC.Mock;
with TKMRPC.Results;

with Test_Utils;

package body TKMRPC_ORB_Tests
is
   use Ahven;
   use TKMRPC;

   package ICS renames Interfaces.C.Strings;

   -------------------------------------------------------------------------

   procedure C_Test_Client
   is
      use type TKMRPC.Types.nc_id_type;
      use type TKMRPC.Types.nonce_length_type;

      RPC_Server : Transport.Servers.Server_Type;
      Args       : GNAT.OS_Lib.Argument_List (1 .. 0);
      Success    : Boolean := False;
   begin
      Transport.Servers.Listen
        (Server  => RPC_Server,
         Address => Test_Utils.Communication_Socket,
         Process => Dispatchers.IKE.Dispatch'Access);
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
      use type TKMRPC.Types.nonce_type;
      use type TKMRPC.Types.nc_id_type;
      use type TKMRPC.Types.nonce_length_type;
      use type TKMRPC.Results.Result_Type;

      RPC_Server : Transport.Servers.Server_Type;
      Nonce      : Types.nonce_type;
      Result     : Results.Result_Type;
      Address    : ICS.chars_ptr
        := ICS.New_String (Str => Test_Utils.Communication_Socket);
   begin
      Transport.Servers.Listen
        (Server  => RPC_Server,
         Address => Test_Utils.Communication_Socket,
         Process => Dispatchers.IKE.Dispatch'Access);

      Clients.IKE.Init (Result  => Result,
                        Address => Address);
      ICS.Free (Item => Address);

      Assert (Condition => Result = Results.OK,
              Message   => "IKE init failed");

      Clients.IKE.nc_create (nc_id        => 123,
                             nonce_length => 243,
                             nonce        => Nonce,
                             Result       => Result);

      Assert (Condition => Result = Results.OK,
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

end TKMRPC_ORB_Tests;
