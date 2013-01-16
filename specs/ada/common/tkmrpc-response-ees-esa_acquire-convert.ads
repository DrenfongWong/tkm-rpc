with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.EES.esa_acquire;

package Tkmrpc.Response.Ees.Esa_Acquire.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Esa_Acquire.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Esa_Acquire.Response_Type);

end Tkmrpc.Response.Ees.Esa_Acquire.Convert;
