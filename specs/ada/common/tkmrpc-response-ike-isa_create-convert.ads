with Ada.Unchecked_Conversion;

package Tkmrpc.Response.Ike.Isa_Create.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Isa_Create.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Isa_Create.Response_Type);

end Tkmrpc.Response.Ike.Isa_Create.Convert;
