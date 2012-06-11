with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Ike.Cc_Set_User_Certificate.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Cc_Set_User_Certificate.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Cc_Set_User_Certificate.Request_Type);

end Tkmrpc.Request.Ike.Cc_Set_User_Certificate.Convert;
