with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.esa_reset;

package Tkmrpc.Response.Ike.Esa_Reset.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Esa_Reset.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Esa_Reset.Response_Type);

end Tkmrpc.Response.Ike.Esa_Reset.Convert;
