with Ada.Unchecked_Conversion;

package Tkmrpc.Response.Cfg.Tkm_Reset.Convert is

   function To_Response is new Ada.Unchecked_Conversion (
      Source => Tkm_Reset.Response_Type,
      Target => Response.Data_Type);

   function From_Response is new Ada.Unchecked_Conversion (
      Source => Response.Data_Type,
      Target => Tkm_Reset.Response_Type);

end Tkmrpc.Response.Cfg.Tkm_Reset.Convert;
