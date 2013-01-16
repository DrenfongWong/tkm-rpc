with Tkmrpc.Types;

--# inherit
--#    Tkmrpc.Types;

package Tkmrpc.Contexts.nc
--# own State : State_Type;
--# initializes State;
is

   --# type State_Type is abstract;

   type nc_State_Type is
      (clean,
       --  No nonce present.
       invalid,
       --  Error state.
       created
       --  Nonce available.
      );

   function Get_State
     (Id : Types.nc_id_type)
      return nc_State_Type;
   --# global State;

   procedure consume
     (Id : Types.nc_id_type;
      nonce : out Types.nonce_type);
   --# global in out State;
   --# derives
   --#    State,
   --#    nonce
   --#       from
   --#          State,
   --#          Id;

   procedure create
     (Id : Types.nc_id_type;
      nonce : Types.nonce_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          nonce;

   procedure invalidate
     (Id : Types.nc_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure reset
     (Id : Types.nc_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

end Tkmrpc.Contexts.nc;
