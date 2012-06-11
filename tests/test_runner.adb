with Ada.Text_IO;

with Ahven.Text_Runner;
with Ahven.Framework;

with Tkmrpc_Request_Tests;
with Tkmrpc_Response_Tests;
with Tkmrpc_Transport_Tests;
with Tkmrpc_Ophandlers_Tests;
with Tkmrpc_ORB_Tests;

procedure Test_Runner
is
   use Ahven.Framework;

   Name : constant String            := "Tkmrpc tests";
   S    : constant Test_Suite_Access := Create_Suite (Suite_Name => Name);
begin
   Add_Test (Suite => S.all,
             T     => new Tkmrpc_Request_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Tkmrpc_Response_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Tkmrpc_Transport_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Tkmrpc_Ophandlers_Tests.Testcase);
   Add_Test (Suite => S.all,
             T     => new Tkmrpc_ORB_Tests.Testcase);

   Ada.Text_IO.Put_Line ("Running " & Name & " ... please wait");

   Ahven.Text_Runner.Run (Suite => S);
   Release_Suite (T => S);

end Test_Runner;
