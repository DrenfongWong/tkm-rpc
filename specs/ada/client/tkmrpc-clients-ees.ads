with Interfaces.C.Strings;

with Tkmrpc.Types;
with Tkmrpc.Results;

package Tkmrpc.Clients.Ees is

   procedure Init
     (Result  : out Results.Result_Type;
      Address : Interfaces.C.Strings.chars_ptr);
   pragma Export (C, Init, "ees_init");
   pragma Export_Valued_Procedure (Init);
   --  Initialize EES client with given address.

   procedure Esa_Acquire
     (Result : out Results.Result_Type;
      Sp_Id  : Types.Sp_Id_Type);
   pragma Export (C, Esa_Acquire, "ees_esa_acquire");
   pragma Export_Valued_Procedure
     (Esa_Acquire,
      Mechanism => (Sp_Id => Value));
   --  Trigger 'Acquire' event for an ESP SA.

   procedure Esa_Expire
     (Result   : out Results.Result_Type;
      Sp_Id    : Types.Sp_Id_Type;
      Spi_Rem  : Types.Esp_Spi_Type;
      Protocol : Types.Protocol_Type;
      Hard     : Types.Expiry_Flag_Type);
   pragma Export (C, Esa_Expire, "ees_esa_expire");
   pragma Export_Valued_Procedure
     (Esa_Expire,
      Mechanism =>
     (Sp_Id    => Value,
      Spi_Rem  => Value,
      Protocol => Value,
      Hard     => Value));
   --  Trigger 'Expire' event for an ESP SA.

end Tkmrpc.Clients.Ees;
