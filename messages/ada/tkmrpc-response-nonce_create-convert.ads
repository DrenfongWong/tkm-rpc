with Ada.Unchecked_Conversion;

package TKMRPC.Response.Nonce_Create.Convert
is
   function To_Response is new
     Ada.Unchecked_Conversion
       (Source => Nonce_Create.Response_Type,
        Target => Response.Data_Type);

   function From_Response is new
     Ada.Unchecked_Conversion
       (Source => Response.Data_Type,
        Target => Nonce_Create.Response_Type);

end TKMRPC.Response.Nonce_Create.Convert;
