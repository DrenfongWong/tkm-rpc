with Ada.Unchecked_Conversion;

package TKMRPC.Response.IKE.dh_reset.Convert
is

   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => dh_reset.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => dh_reset.Response_Type);

end TKMRPC.Response.IKE.dh_reset.Convert;
