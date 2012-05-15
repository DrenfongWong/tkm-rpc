with Ada.Unchecked_Conversion;

package TKMRPC.Request.Nonce_Create.Convert
is
   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => Nonce_Create.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => Nonce_Create.Request_Type);

end TKMRPC.Request.Nonce_Create.Convert;
