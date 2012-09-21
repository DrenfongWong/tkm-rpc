with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ees.Esa_Expire.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Esa_Expire.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Esa_Expire.Request_Type);

end Tkmrpc.Request.Ees.Esa_Expire.Convert;
