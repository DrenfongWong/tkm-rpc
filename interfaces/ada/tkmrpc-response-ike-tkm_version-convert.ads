with Ada.Unchecked_Conversion;

package TKMRPC.Response.IKE.tkm_version.Convert
is

   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => tkm_version.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => tkm_version.Response_Type);

end TKMRPC.Response.IKE.tkm_version.Convert;
