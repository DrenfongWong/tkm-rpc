with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.cc_set_user_certificate;

package Tkmrpc.Response.Ike.Cc_Set_User_Certificate.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Cc_Set_User_Certificate.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Cc_Set_User_Certificate.Response_Type);

end Tkmrpc.Response.Ike.Cc_Set_User_Certificate.Convert;
