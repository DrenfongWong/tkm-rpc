with Ada.Unchecked_Conversion;

package Tkmrpc.Response.Ike.Nc_Create.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Nc_Create.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Nc_Create.Response_Type);

end Tkmrpc.Response.Ike.Nc_Create.Convert;
