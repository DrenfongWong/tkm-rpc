with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.cc_check_ca;

package Tkmrpc.Response.Ike.Cc_Check_Ca.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Cc_Check_Ca.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Cc_Check_Ca.Response_Type);

end Tkmrpc.Response.Ike.Cc_Check_Ca.Convert;
