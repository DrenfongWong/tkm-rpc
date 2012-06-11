with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.esa_create.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => esa_create.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => esa_create.Request_Type);

end TKMRPC.Request.IKE.esa_create.Convert;
