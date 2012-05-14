with Ada.Containers.Indefinite_Ordered_Maps;

with TKMRPC.Servers;
with TKMRPC.Request;
with TKMRPC.Response;
with TKMRPC.Constants;

package body TKMRPC.Operation_Dispatcher
is

   use TKMRPC.Operation_Handlers;
   use type TKMRPC.Operations.Operation_Type;

   package Map_Of_Ophandlers is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type     => Operations.Operation_Type,
      Element_Type => Handler_Interface'Class);
   package MOO renames Map_Of_Ophandlers;

   RPC_Server : Servers.Server_Type;
   Ophandlers : MOO.Map;
   Next_Reply : Response.Data_Type;

   procedure Request_Callback (Data : Request.Data_Type);
   --  Dispatch the given request to the registered operation handler for the
   --  opcode. The procedure also initializes the response which is sent back
   --  to the client.

   procedure Response_Callback (Data : out Response.Data_Type);
   --  Return the request reply (Next_Reply) to the RPC server for sending.

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

   procedure Register
     (Handler : Handler_Interface'Class;
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

   procedure Request_Callback (Data : Request.Data_Type)
   is
      use type MOO.Cursor;

      Reply  : Response.Data_Type;
      Cursor : constant MOO.Cursor := Ophandlers.Find
        (Key => Data.Header.Operation);
   begin
      if Cursor = MOO.No_Element then
         Next_Reply                   := Constants.Invalid_Operation;
         Next_Reply.Header.Request_ID := Data.Header.Request_ID;
         return;
      end if;

      MOO.Element (Position => Cursor).Handle
        (Req => Data,
         Res => Reply);

      Next_Reply := Reply;
   end Request_Callback;

   -------------------------------------------------------------------------

   procedure Response_Callback (Data : out Response.Data_Type)
   is
   begin
      Data := Next_Reply;
   end Response_Callback;

   -------------------------------------------------------------------------

   procedure Start
   is
   begin
      Servers.Listen
        (Server  => RPC_Server,
         Address => Communication_Socket,
         Receive => Request_Callback'Access,
         Respond => Response_Callback'Access);
   end Start;

   -------------------------------------------------------------------------

   procedure Stop
   is
   begin
      Servers.Stop (Server => RPC_Server);
   end Stop;

end TKMRPC.Operation_Dispatcher;