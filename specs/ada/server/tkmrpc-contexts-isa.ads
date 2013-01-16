with Tkmrpc.Types;

--# inherit
--#    Tkmrpc.Types;

package Tkmrpc.Contexts.isa
--# own State : State_Type;
--# initializes State;
is

   --# type State_Type is abstract;

   type isa_State_Type is
      (clean,
       --  Initial clean state
       invalid,
       --  Error state
       stale,
       --  IKE SA stale.
       active
       --  IKE SA is in active use.
      );

   function Get_State
     (Id : Types.isa_id_type)
      return isa_State_Type;
   --# global State;

   procedure create
     (Id : Types.isa_id_type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      sk_d : Types.key_type;
      creation_time : Types.rel_time_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          ae_id,
   --#          ia_id,
   --#          sk_d,
   --#          creation_time;

   function get_ae_id
     (Id : Types.isa_id_type)
      return Types.ae_id_type;
   --# global State;

   function get_sk_d
     (Id : Types.isa_id_type)
      return Types.key_type;
   --# global State;

   procedure invalidate
     (Id : Types.isa_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure reset
     (Id : Types.isa_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

end Tkmrpc.Contexts.isa;
