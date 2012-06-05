with Ada.Unchecked_Conversion;

package TKMRPC.Request.CFG.tkm_version.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => tkm_version.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => tkm_version.Request_Type);

end TKMRPC.Request.CFG.tkm_version.Convert;
