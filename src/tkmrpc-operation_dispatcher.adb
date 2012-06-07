with Ada.Containers.Indefinite_Ordered_Maps;
with Ada.Unchecked_Deallocation;

with TKMRPC.Transport.Servers;
with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Constants;

package body TKMRPC.Operation_Dispatcher
is
   use TKMRPC.Operation_Handlers;
   use type TKMRPC.Operations.Operation_Type;

   package Map_Of_Ophandlers is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type     => Operations.Operation_Type,
      Element_Type => Op_Handler);
   package MOO renames Map_Of_Ophandlers;

   type Server_Access is access Transport.Servers.Server_Type;
   --  Handle to RPC server.

   procedure Free is new Ada.Unchecked_Deallocation
     (Object => Transport.Servers.Server_Type,
      Name   => Server_Access);
   --  Free memory allocated for RPC server.

   RPC_Server : Server_Access;
   Ophandlers : MOO.Map;

   procedure Process_Callback
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch the given request to the registered operation handler for the
   --  opcode. The procedure returns the response which is sent back to the
   --  client.

   -------------------------------------------------------------------------

   procedure Clear
   is
   begin
      Ophandlers.Clear;
   end Clear;

   -------------------------------------------------------------------------

   function Get_Handler_Count return Natural
   is
   begin
      return Natural (Ophandlers.Length);
   end Get_Handler_Count;

   -------------------------------------------------------------------------

   procedure Process_Callback
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      use type MOO.Cursor;

      Cursor : constant MOO.Cursor := Ophandlers.Find
        (Key => Req.Header.Operation);
   begin
      if Cursor = MOO.No_Element then
         Res := Constants.Invalid_Operation;
      else
         MOO.Element (Position => Cursor).all
           (Req => Req,
            Res => Res);
      end if;

      Res.Header.Request_ID := Req.Header.Request_ID;
   end Process_Callback;

   -------------------------------------------------------------------------

   procedure Register
     (Handler : Op_Handler;
      Opcode  : Operations.Operation_Type)
   is
   begin
      Ophandlers.Insert (Key      => Opcode,
                         New_Item => Handler);

   exception
      when Constraint_Error =>
         raise Opcode_Taken with "Handler for operation code" & Opcode'Img
           & " already registered";
   end Register;

   -------------------------------------------------------------------------

   procedure Start
   is
   begin
      if RPC_Server /= null then
         return;
      end if;

      RPC_Server := new Transport.Servers.Server_Type;

      Transport.Servers.Listen
        (Server  => RPC_Server.all,
         Address => Communication_Socket,
         Process => Process_Callback'Access);
   end Start;

   -------------------------------------------------------------------------

   procedure Stop
   is
   begin
      Transport.Servers.Stop (Server => RPC_Server.all);
      Free (X => RPC_Server);
   end Stop;

end TKMRPC.Operation_Dispatcher;
