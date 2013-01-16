with Tkmrpc.Types;
with Tkmrpc.Results;

--# inherit
--#    Tkmrpc.Types,
--#    Tkmrpc.Results;

package Tkmrpc.Servers.Ees
   --# own State : State_Type;
   --# initializes State;
is

   --# type State_Type is abstract;

   procedure Init;
   --  Initialize EES server.
   --# global State;
   --# derives State from *;

   procedure Finalize;
   --  Finalize EES server.
   --# global State;
   --# derives State from *;

   procedure Esa_Acquire
     (Result : out Results.Result_Type;
      Sp_Id  : Types.Sp_Id_Type);
   --  Trigger 'Acquire' event for an ESP SA.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               sp_id;

   procedure Esa_Expire
     (Result   : out Results.Result_Type;
      Sp_Id    : Types.Sp_Id_Type;
      Spi_Rem  : Types.Esp_Spi_Type;
      Protocol : Types.Protocol_Type;
      Hard     : Types.Expiry_Flag_Type);
   --  Trigger 'Expire' event for an ESP SA.
   --# global State;
   --# derives
   --#    Result
   --#          from State,
   --#               sp_id,
   --#               spi_rem,
   --#               protocol,
   --#               hard;

end Tkmrpc.Servers.Ees;
