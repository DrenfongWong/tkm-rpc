with Ada.Text_IO;

with Ahven.Text_Runner;
with Ahven.Framework;

with TKMRPC_Request_Tests;

procedure Test_Runner is
   use Ahven.Framework;

   Name : constant String            := "TKMRPC tests";
   S    : constant Test_Suite_Access := Create_Suite (Suite_Name => Name);
begin
   Add_Test (Suite => S.all,
             T     => new TKMRPC_Request_Tests.Testcase);

   Ada.Text_IO.Put_Line ("Running " & Name & " ... please wait");

   Ahven.Text_Runner.Run (Suite => S);
   Release_Suite (T => S);
end Test_Runner;
