with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.esa_create_first;

package Tkmrpc.Request.Ike.Esa_Create_First.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Esa_Create_First.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Esa_Create_First.Request_Type);

end Tkmrpc.Request.Ike.Esa_Create_First.Convert;
