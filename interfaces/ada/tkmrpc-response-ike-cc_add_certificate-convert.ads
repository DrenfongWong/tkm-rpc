with Ada.Unchecked_Conversion;

package TKMRPC.Response.IKE.cc_add_certificate.Convert
is

   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => cc_add_certificate.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => cc_add_certificate.Response_Type);

end TKMRPC.Response.IKE.cc_add_certificate.Convert;