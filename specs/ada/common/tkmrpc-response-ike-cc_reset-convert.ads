with Ada.Unchecked_Conversion;

package TKMRPC.Response.IKE.cc_reset.Convert
is

   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => cc_reset.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => cc_reset.Response_Type);

end TKMRPC.Response.IKE.cc_reset.Convert;
