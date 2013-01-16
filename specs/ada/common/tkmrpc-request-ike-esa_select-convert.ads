with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.esa_select;

package Tkmrpc.Request.Ike.Esa_Select.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Esa_Select.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Esa_Select.Request_Type);

end Tkmrpc.Request.Ike.Esa_Select.Convert;
