with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ees.Esa_Acquire.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Esa_Acquire.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Esa_Acquire.Request_Type);

end Tkmrpc.Request.Ees.Esa_Acquire.Convert;
