with Tkmrpc.Types;

--# inherit
--#    Tkmrpc.Types;

package Tkmrpc.Contexts.ae
--# own State : State_Type;
--# initializes State;
is

   --# type State_Type is abstract;

   type ae_State_Type is
      (clean,
       --  Initial clean state.
       invalid,
       --  Error state.
       stale,
       --  AE context is stale.
       unauth,
       --  AE context is unauthenticated.
       loc_auth,
       --  Local identity of AE is authenticated.
       authenticated,
       --  AE is authenticated.
       active
       --  AE is authenticated and in use.
      );

   function Get_State
     (Id : Types.ae_id_type)
      return ae_State_Type;
   --# global State;

   procedure activate
     (Id : Types.ae_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure authenticate
     (Id : Types.ae_id_type;
      ca_context : Types.ca_id_type;
      authag_id : Types.authag_id_type;
      ri_id : Types.ri_id_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          ca_context,
   --#          authag_id,
   --#          ri_id,
   --#          not_before,
   --#          not_after;

   procedure create
     (Id : Types.ae_id_type;
      iag_id : Types.iag_id_type;
      dhag_id : Types.dhag_id_type;
      creation_time : Types.rel_time_type;
      initiator : Types.init_type;
      sk_ike_auth_loc : Types.key_type;
      sk_ike_auth_rem : Types.key_type;
      nonce_loc : Types.nonce_type;
      nonce_rem : Types.nonce_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          iag_id,
   --#          dhag_id,
   --#          creation_time,
   --#          initiator,
   --#          sk_ike_auth_loc,
   --#          sk_ike_auth_rem,
   --#          nonce_loc,
   --#          nonce_rem;

   function get_lc_id
     (Id : Types.ae_id_type)
      return Types.lc_id_type;
   --# global State;

   function get_nonce_loc
     (Id : Types.ae_id_type)
      return Types.nonce_type;
   --# global State;

   function get_nonce_rem
     (Id : Types.ae_id_type)
      return Types.nonce_type;
   --# global State;

   function get_ri_id
     (Id : Types.ae_id_type)
      return Types.ri_id_type;
   --# global State;

   function get_sk_ike_auth_loc
     (Id : Types.ae_id_type)
      return Types.key_type;
   --# global State;

   function get_sk_ike_auth_rem
     (Id : Types.ae_id_type)
      return Types.key_type;
   --# global State;

   procedure invalidate
     (Id : Types.ae_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   function is_initiator
     (Id : Types.ae_id_type)
      return Types.init_type;
   --# global State;

   procedure reset
     (Id : Types.ae_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure sign
     (Id : Types.ae_id_type;
      lc_id : Types.lc_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          lc_id;

end Tkmrpc.Contexts.ae;
