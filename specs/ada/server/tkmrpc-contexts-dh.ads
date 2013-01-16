with Tkmrpc.Types;

--# inherit
--#    Tkmrpc.Types;

package Tkmrpc.Contexts.dh
--# own State : State_Type;
--# initializes State;
is

   --# type State_Type is abstract;

   type dh_State_Type is
      (clean,
       --  Initial clean state.
       invalid,
       --  Error state.
       stale,
       --  DH context is stale.
       created,
       --  Waiting for remote pubvalue.
       generated
       --  Diffie-Hellman shared secret has been calculated and is ready to be used.
      );

   function Get_State
     (Id : Types.dh_id_type)
      return dh_State_Type;
   --# global State;

   procedure consume
     (Id : Types.dh_id_type;
      dh_key : out Types.dh_key_type);
   --# global in out State;
   --# derives
   --#    State,
   --#    dh_key
   --#       from
   --#          State,
   --#          Id;

   procedure create
     (Id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      secvalue : Types.dh_priv_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          dha_id,
   --#          secvalue;

   procedure generate
     (Id : Types.dh_id_type;
      dh_key : Types.dh_key_type;
      timestamp : Types.rel_time_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          dh_key,
   --#          timestamp;

   function get_dha_id
     (Id : Types.dh_id_type)
      return Types.dha_id_type;
   --# global State;

   function get_secvalue
     (Id : Types.dh_id_type)
      return Types.dh_priv_type;
   --# global State;

   procedure invalidate
     (Id : Types.dh_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure reset
     (Id : Types.dh_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

end Tkmrpc.Contexts.dh;
