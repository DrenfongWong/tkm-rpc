with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.isa_create_child;

package Tkmrpc.Request.Ike.Isa_Create_Child.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Isa_Create_Child.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Isa_Create_Child.Request_Type);

end Tkmrpc.Request.Ike.Isa_Create_Child.Convert;
