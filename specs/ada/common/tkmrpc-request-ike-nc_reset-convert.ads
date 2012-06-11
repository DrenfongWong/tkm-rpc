with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ike.Nc_Reset.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Nc_Reset.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Nc_Reset.Request_Type);

end Tkmrpc.Request.Ike.Nc_Reset.Convert;
