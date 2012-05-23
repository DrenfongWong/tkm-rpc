with TKMRPC.Nonces;
with TKMRPC.Client;
with TKMRPC.Server;
with TKMRPC.Mock;
with TKMRPC.Implementation;

package body TKMRPC_ORB_Tests
is
   use Ahven;
   use TKMRPC;

   Impl : aliased Mock.TKM_Type;
   --  TKM mock implementation.

   -------------------------------------------------------------------------

   procedure Client_Server_ORBs
   is
      use type TKMRPC.Nonces.Nonce_Type;
      use type TKMRPC.Nonces.Nonce_Id_Type;

      Nonce     : Nonces.Nonce_Type;
      Ref_Nonce : Nonces.Nonce_Type := Mock.Ref_Nonce;
   begin
      Server.Start (TKM => Impl'Access);
      Client.Init;
      Nonce := Client.Nc_Create (Nonce_Id     => 123,
                                 Nonce_Length => 243);

      --  The client ORB fills in the nonce length, update ref nonce.

      Ref_Nonce.Length := 243;

      Assert (Condition => Nonce = Ref_Nonce,
              Message   => "Nonce incorrect");
      Assert (Condition => Mock.Last_Nonce_Id = 123,
              Message   => "Last nonce id mismatch");
      Assert (Condition => Mock.Last_Nonce_Length = 243,
              Message   => "Last nonce length mismatch");

      --  Provoke error on server side.

      Implementation.Unregister;
      begin
         declare
            Dummy : Nonces.Nonce_Type := Client.Nc_Create
              (Nonce_Id     => 123,
               Nonce_Length => 243);
            pragma Unreferenced (Dummy);
         begin
            Fail (Message => "Exception expected");
         end;

      exception
         when Client.RPC_Error => null;
      end;

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
         Name    => "ORB interaction: client/server");
   end Initialize;

end TKMRPC_ORB_Tests;
