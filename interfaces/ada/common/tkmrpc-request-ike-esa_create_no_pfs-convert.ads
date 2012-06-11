with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.esa_create_no_pfs.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => esa_create_no_pfs.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => esa_create_no_pfs.Request_Type);

end TKMRPC.Request.IKE.esa_create_no_pfs.Convert;
