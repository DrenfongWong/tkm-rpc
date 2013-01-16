package body Tkmrpc.Contexts.ae
--# own State is Context_Array;
is

   type ae_FSM_Type is record
      State : ae_State_Type;
      iag_id : Types.iag_id_type;
      dhag_id : Types.dhag_id_type;
      ca_id : Types.ca_id_type;
      lc_id : Types.lc_id_type;
      ri_id : Types.ri_id_type;
      authag_id : Types.authag_id_type;
      initiator : Types.init_type;
      nonce_loc : Types.nonce_type;
      nonce_rem : Types.nonce_type;
      sk_ike_auth_loc : Types.key_type;
      sk_ike_auth_rem : Types.key_type;
      creation_time : Types.rel_time_type;
      cc_not_before : Types.abs_time_type;
      cc_not_after : Types.abs_time_type;
   end record;
   --  Authentication Endpoint Context

   Null_ae_FSM : constant ae_FSM_Type
     := ae_FSM_Type'
      (State => clean,
       iag_id => Types.iag_id_type'First,
       dhag_id => Types.dhag_id_type'First,
       ca_id => Types.ca_id_type'First,
       lc_id => Types.lc_id_type'First,
       ri_id => Types.ri_id_type'First,
       authag_id => Types.authag_id_type'First,
       initiator => Types.init_type'First,
       nonce_loc => Types.Null_nonce_type,
       nonce_rem => Types.Null_nonce_type,
       sk_ike_auth_loc => Types.Null_key_type,
       sk_ike_auth_rem => Types.Null_key_type,
       creation_time => Types.rel_time_type'First,
       cc_not_before => Types.abs_time_type'First,
       cc_not_after => Types.abs_time_type'First);

   type Context_Array_Type is
     array (Types.ae_id_type) of ae_FSM_Type;

   Context_Array : Context_Array_Type := Context_Array_Type'
     (others => (Null_ae_FSM));

   -------------------------------------------------------------------------

   function Get_State
     (Id : Types.ae_id_type)
      return ae_State_Type
   --# global Context_Array;
   --# return Context_Array (Id).State;
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   procedure activate
     (Id : Types.ae_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# pre
   --#   Context_Array (Id).State = authenticated;
   --# post
   --#   Context_Array (Id).State = active;
   is
   begin
      Context_Array (Id).State := active;
   end activate;

   -------------------------------------------------------------------------

   procedure authenticate
     (Id : Types.ae_id_type;
      ca_context : Types.ca_id_type;
      authag_id : Types.authag_id_type;
      ri_id : Types.ri_id_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          ca_context,
   --#          authag_id,
   --#          ri_id,
   --#          not_before,
   --#          not_after;
   --# pre
   --#   Context_Array (Id).State = loc_auth;
   --# post
   --#   Context_Array (Id).State = authenticated;
   is
   begin
      Context_Array (Id).ca_id := ca_context;
      Context_Array (Id).authag_id := authag_id;
      Context_Array (Id).ri_id := ri_id;
      Context_Array (Id).cc_not_before := not_before;
      Context_Array (Id).cc_not_after := not_after;
      Context_Array (Id).State := authenticated;
   end authenticate;

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.ae_id_type;
      iag_id : Types.iag_id_type;
      dhag_id : Types.dhag_id_type;
      creation_time : Types.rel_time_type;
      initiator : Types.init_type;
      sk_ike_auth_loc : Types.key_type;
      sk_ike_auth_rem : Types.key_type;
      nonce_loc : Types.nonce_type;
      nonce_rem : Types.nonce_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          iag_id,
   --#          dhag_id,
   --#          creation_time,
   --#          initiator,
   --#          sk_ike_auth_loc,
   --#          sk_ike_auth_rem,
   --#          nonce_loc,
   --#          nonce_rem;
   --# pre
   --#   Context_Array (Id).State = clean;
   --# post
   --#   Context_Array (Id).State = unauth;
   is
   begin
      Context_Array (Id).iag_id := iag_id;
      Context_Array (Id).dhag_id := dhag_id;
      Context_Array (Id).creation_time := creation_time;
      Context_Array (Id).initiator := initiator;
      Context_Array (Id).sk_ike_auth_loc := sk_ike_auth_loc;
      Context_Array (Id).sk_ike_auth_rem := sk_ike_auth_rem;
      Context_Array (Id).nonce_loc := nonce_loc;
      Context_Array (Id).nonce_rem := nonce_rem;
      Context_Array (Id).State := unauth;
   end create;

   -------------------------------------------------------------------------

   function get_lc_id
     (Id : Types.ae_id_type)
      return Types.lc_id_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = authenticated or
   --#   Context_Array (Id).State = active;
   --# return Context_Array (Id).lc_id;
   is
   begin
      return Context_Array (Id).lc_id;
   end get_lc_id;

   -------------------------------------------------------------------------

   function get_nonce_loc
     (Id : Types.ae_id_type)
      return Types.nonce_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = authenticated or
   --#   Context_Array (Id).State = loc_auth;
   --# return Context_Array (Id).nonce_loc;
   is
   begin
      return Context_Array (Id).nonce_loc;
   end get_nonce_loc;

   -------------------------------------------------------------------------

   function get_nonce_rem
     (Id : Types.ae_id_type)
      return Types.nonce_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = authenticated or
   --#   Context_Array (Id).State = unauth;
   --# return Context_Array (Id).nonce_rem;
   is
   begin
      return Context_Array (Id).nonce_rem;
   end get_nonce_rem;

   -------------------------------------------------------------------------

   function get_ri_id
     (Id : Types.ae_id_type)
      return Types.ri_id_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = authenticated or
   --#   Context_Array (Id).State = active;
   --# return Context_Array (Id).ri_id;
   is
   begin
      return Context_Array (Id).ri_id;
   end get_ri_id;

   -------------------------------------------------------------------------

   function get_sk_ike_auth_loc
     (Id : Types.ae_id_type)
      return Types.key_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = unauth;
   --# return Context_Array (Id).sk_ike_auth_loc;
   is
   begin
      return Context_Array (Id).sk_ike_auth_loc;
   end get_sk_ike_auth_loc;

   -------------------------------------------------------------------------

   function get_sk_ike_auth_rem
     (Id : Types.ae_id_type)
      return Types.key_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = loc_auth;
   --# return Context_Array (Id).sk_ike_auth_rem;
   is
   begin
      return Context_Array (Id).sk_ike_auth_rem;
   end get_sk_ike_auth_rem;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.ae_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# post
   --#   Context_Array (Id).State = invalid;
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   function is_initiator
     (Id : Types.ae_id_type)
      return Types.init_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = authenticated;
   --# return Context_Array (Id).initiator;
   is
   begin
      return Context_Array (Id).initiator;
   end is_initiator;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.ae_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# post
   --#   Context_Array (Id).State = clean;
   is
   begin
      Context_Array (Id).iag_id := Types.iag_id_type'First;
      Context_Array (Id).dhag_id := Types.dhag_id_type'First;
      Context_Array (Id).ca_id := Types.ca_id_type'First;
      Context_Array (Id).lc_id := Types.lc_id_type'First;
      Context_Array (Id).ri_id := Types.ri_id_type'First;
      Context_Array (Id).authag_id := Types.authag_id_type'First;
      Context_Array (Id).initiator := Types.init_type'First;
      Context_Array (Id).nonce_loc := Types.Null_nonce_type;
      Context_Array (Id).nonce_rem := Types.Null_nonce_type;
      Context_Array (Id).sk_ike_auth_loc := Types.Null_key_type;
      Context_Array (Id).sk_ike_auth_rem := Types.Null_key_type;
      Context_Array (Id).creation_time := Types.rel_time_type'First;
      Context_Array (Id).cc_not_before := Types.abs_time_type'First;
      Context_Array (Id).cc_not_after := Types.abs_time_type'First;
      Context_Array (Id).State := clean;
   end reset;

   -------------------------------------------------------------------------

   procedure sign
     (Id : Types.ae_id_type;
      lc_id : Types.lc_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          lc_id;
   --# pre
   --#   Context_Array (Id).State = unauth;
   --# post
   --#   Context_Array (Id).State = loc_auth;
   is
   begin
      Context_Array (Id).lc_id := lc_id;
      Context_Array (Id).State := loc_auth;
   end sign;

end Tkmrpc.Contexts.ae;
