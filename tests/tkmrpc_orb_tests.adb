with TKMRPC.Types;
with TKMRPC.Clients.IKE;
with TKMRPC.Servers.IKE;
with TKMRPC.Server;
with TKMRPC.Mock;
with TKMRPC.Results;

with GNAT.OS_Lib;

package body TKMRPC_ORB_Tests
is
   use Ahven;
   use TKMRPC;

   Impl : aliased Mock.TKM_Type;
   --  TKM mock implementation.

   -------------------------------------------------------------------------

   procedure C_Test_Client
   is
      use type TKMRPC.Types.nc_id_type;
      use type TKMRPC.Types.nonce_length_type;

      Args    : GNAT.OS_Lib.Argument_List (1 .. 0);
      Success : Boolean := False;
   begin
      Server.Start (TKM => Impl'Access);
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

      Server.Stop;
      Mock.Last_Nonce_Id     := 0;
      Mock.Last_Nonce_Length := 16;

   exception
      when others =>
         Server.Stop;
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

      Nonce  : Types.nonce_type;
      Result : Results.Result_Type;
   begin
      Server.Start (TKM => Impl'Access);
      Clients.IKE.Init (Result => Result);

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

      --  Provoke error on server side.

      Servers.IKE.Unregister;
      Clients.IKE.nc_create (nc_id        => 123,
                             nonce_length => 243,
                             nonce        => Nonce,
                             Result       => Result);
      Assert (Condition => Result /= Results.OK,
              Message   => "Error expected");

      Server.Stop;
      Mock.Last_Nonce_Id     := 0;
      Mock.Last_Nonce_Length := 16;

   exception
      when others =>
         Server.Stop;
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
