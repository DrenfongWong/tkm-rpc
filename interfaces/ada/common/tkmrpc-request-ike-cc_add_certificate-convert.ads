with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.cc_add_certificate.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => cc_add_certificate.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => cc_add_certificate.Request_Type);

end TKMRPC.Request.IKE.cc_add_certificate.Convert;
