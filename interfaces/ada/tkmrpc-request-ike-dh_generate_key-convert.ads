with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.dh_generate_key.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => dh_generate_key.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => dh_generate_key.Request_Type);

end TKMRPC.Request.IKE.dh_generate_key.Convert;
