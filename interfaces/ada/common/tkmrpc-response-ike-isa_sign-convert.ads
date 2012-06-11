with Ada.Unchecked_Conversion;

package TKMRPC.Response.IKE.isa_sign.Convert
is

   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => isa_sign.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => isa_sign.Response_Type);

end TKMRPC.Response.IKE.isa_sign.Convert;
