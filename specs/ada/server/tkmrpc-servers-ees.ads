with Tkmrpc.Types;
with Tkmrpc.Results;

package Tkmrpc.Servers.Ees
is

   procedure Init;
   --  Initialize EES server.

   procedure Finalize;
   --  Finalize EES server.

   procedure Esa_Acquire
     (Result : out Results.Result_Type;
      Sp_Id  : Types.Sp_Id_Type);
   --  Trigger 'Acquire' event for an ESP SA.

   procedure Esa_Expire
     (Result   : out Results.Result_Type;
      Sp_Id    : Types.Sp_Id_Type;
      Spi_Rem  : Types.Esp_Spi_Type;
      Protocol : Types.Protocol_Type;
      Hard     : Types.Expiry_Flag_Type);
   --  Trigger 'Expire' event for an ESP SA.

end Tkmrpc.Servers.Ees;
