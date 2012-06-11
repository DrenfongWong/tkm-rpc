with Ada.Unchecked_Conversion;

package Tkmrpc.Response.Ike.Ae_Reset.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Ae_Reset.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Ae_Reset.Response_Type);

end Tkmrpc.Response.Ike.Ae_Reset.Convert;
