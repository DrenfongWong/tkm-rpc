with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.tkm_limits;

package Tkmrpc.Response.Ike.Tkm_Limits.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Tkm_Limits.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Tkm_Limits.Response_Type);

end Tkmrpc.Response.Ike.Tkm_Limits.Convert;
