with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Request,
--#    Tkmrpc.Request.IKE.isa_auth;

package Tkmrpc.Request.Ike.Isa_Auth.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Isa_Auth.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Isa_Auth.Request_Type);

end Tkmrpc.Request.Ike.Isa_Auth.Convert;
