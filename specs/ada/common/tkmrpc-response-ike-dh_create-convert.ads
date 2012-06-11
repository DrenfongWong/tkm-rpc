with Ada.Unchecked_Conversion;

package Tkmrpc.Response.Ike.Dh_Create.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Dh_Create.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Dh_Create.Response_Type);

end Tkmrpc.Response.Ike.Dh_Create.Convert;
