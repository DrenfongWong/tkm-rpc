with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.isa_sign;

package Tkmrpc.Response.Ike.Isa_Sign.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Isa_Sign.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Isa_Sign.Response_Type);

end Tkmrpc.Response.Ike.Isa_Sign.Convert;
