with Ada.Unchecked_Conversion;

package Tkmrpc.Request.Cfg.Tkm_Limits.Convert is

   function To_Request is new Ada.Unchecked_Conversion (
      Source => Tkm_Limits.Request_Type,
      Target => Request.Data_Type);

   function From_Request is new Ada.Unchecked_Conversion (
      Source => Request.Data_Type,
      Target => Tkm_Limits.Request_Type);

end Tkmrpc.Request.Cfg.Tkm_Limits.Convert;
