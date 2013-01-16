with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.IKE.dh_generate_key;

package Tkmrpc.Response.Ike.Dh_Generate_Key.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Dh_Generate_Key.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Dh_Generate_Key.Response_Type);

end Tkmrpc.Response.Ike.Dh_Generate_Key.Convert;
