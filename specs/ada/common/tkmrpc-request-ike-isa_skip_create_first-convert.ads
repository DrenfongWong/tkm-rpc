with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ike.Isa_Skip_Create_First.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Isa_Skip_Create_First.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Isa_Skip_Create_First.Request_Type);

end Tkmrpc.Request.Ike.Isa_Skip_Create_First.Convert;
