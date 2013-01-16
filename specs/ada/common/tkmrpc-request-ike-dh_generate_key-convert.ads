with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.dh_generate_key;

package Tkmrpc.Request.Ike.Dh_Generate_Key.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Dh_Generate_Key.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Dh_Generate_Key.Request_Type);

end Tkmrpc.Request.Ike.Dh_Generate_Key.Convert;
