with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ike.Esa_Reset.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Esa_Reset.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Esa_Reset.Request_Type);

end Tkmrpc.Request.Ike.Esa_Reset.Convert;
