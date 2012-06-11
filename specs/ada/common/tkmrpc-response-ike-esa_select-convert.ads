with Ada.Unchecked_Conversion;

package Tkmrpc.Response.Ike.Esa_Select.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Esa_Select.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Esa_Select.Response_Type);

end Tkmrpc.Response.Ike.Esa_Select.Convert;
