with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.tkm_version;

package Tkmrpc.Request.Ike.Tkm_Version.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Tkm_Version.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Tkm_Version.Request_Type);

end Tkmrpc.Request.Ike.Tkm_Version.Convert;
