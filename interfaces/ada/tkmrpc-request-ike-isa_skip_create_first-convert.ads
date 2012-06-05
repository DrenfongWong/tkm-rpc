with Ada.Unchecked_Conversion;

package TKMRPC.Request.IKE.isa_skip_create_first.Convert
is

   function To_Request is new
     Ada.Unchecked_Conversion
       (Source => isa_skip_create_first.Request_Type,
        Target => Request.Data_Type);

   function From_Request is new
     Ada.Unchecked_Conversion
       (Source => Request.Data_Type,
        Target => isa_skip_create_first.Request_Type);

end TKMRPC.Request.IKE.isa_skip_create_first.Convert;