with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ike.Dh_Reset.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Dh_Reset.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Dh_Reset.Request_Type);

end Tkmrpc.Request.Ike.Dh_Reset.Convert;
