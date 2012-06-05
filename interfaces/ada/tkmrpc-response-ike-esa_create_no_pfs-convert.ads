with Ada.Unchecked_Conversion;

package TKMRPC.Response.IKE.esa_create_no_pfs.Convert
is

   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => esa_create_no_pfs.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => esa_create_no_pfs.Response_Type);

end TKMRPC.Response.IKE.esa_create_no_pfs.Convert;
