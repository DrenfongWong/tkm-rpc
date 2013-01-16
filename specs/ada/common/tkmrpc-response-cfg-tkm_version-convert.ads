with Ada.Unchecked_Conversion;

--# inherit
--#    Ada.Unchecked_Conversion,
--#    Tkmrpc.Response,
--#    Tkmrpc.Response.CFG.tkm_version;

package Tkmrpc.Response.Cfg.Tkm_Version.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Tkm_Version.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Tkm_Version.Response_Type);

end Tkmrpc.Response.Cfg.Tkm_Version.Convert;
