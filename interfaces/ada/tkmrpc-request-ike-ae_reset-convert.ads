with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.ae_reset.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => ae_reset.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => ae_reset.Request_Type);

end TKMRPC.Request.IKE.ae_reset.Convert;
