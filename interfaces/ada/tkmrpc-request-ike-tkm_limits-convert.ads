with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.tkm_limits.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => tkm_limits.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => tkm_limits.Request_Type);

end TKMRPC.Request.IKE.tkm_limits.Convert;
