with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.esa_create_no_pfs;

package Tkmrpc.Response.Ike.Esa_Create_No_Pfs.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Esa_Create_No_Pfs.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Esa_Create_No_Pfs.Response_Type);

end Tkmrpc.Response.Ike.Esa_Create_No_Pfs.Convert;
