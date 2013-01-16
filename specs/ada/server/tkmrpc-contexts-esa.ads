with Tkmrpc.Types;

--# inherit
--#    Tkmrpc.Types;

package Tkmrpc.Contexts.esa
--# own State : State_Type;
--# initializes State;
is

   --# type State_Type is abstract;

   type esa_State_Type is
      (clean,
       --  Initial clean state.
       invalid,
       --  Error state.
       stale,
       --  ESA context is stale.
       selected,
       --  ESA is selected.
       active
       --  ESP SA is active.
      );

   function Get_State
     (Id : Types.esa_id_type)
      return esa_State_Type;
   --# global State;

   procedure create
     (Id : Types.esa_id_type;
      ae_id : Types.ae_id_type;
      ea_id : Types.ea_id_type;
      sp_id : Types.sp_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          ae_id,
   --#          ea_id,
   --#          sp_id;

   procedure invalidate
     (Id : Types.esa_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure reset
     (Id : Types.esa_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure select_sa
     (Id : Types.esa_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure unselect_sa
     (Id : Types.esa_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

end Tkmrpc.Contexts.esa;
