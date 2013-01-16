with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.tkm_reset;

package Tkmrpc.Request.Ike.Tkm_Reset.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Tkm_Reset.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Tkm_Reset.Request_Type);

end Tkmrpc.Request.Ike.Tkm_Reset.Convert;
