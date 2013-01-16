with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.EES.esa_expire;

package Tkmrpc.Response.Ees.Esa_Expire.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Esa_Expire.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Esa_Expire.Response_Type);

end Tkmrpc.Response.Ees.Esa_Expire.Convert;
