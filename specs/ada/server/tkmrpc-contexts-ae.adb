package body Tkmrpc.Contexts.ae
is

   pragma Warnings
     (Off, "* already use-visible through previous use type clause");
   use type Types.ae_id_type;
   use type Types.iag_id_type;
   use type Types.dhag_id_type;
   use type Types.ca_id_type;
   use type Types.lc_id_type;
   use type Types.ri_id_type;
   use type Types.authag_id_type;
   use type Types.init_type;
   use type Types.nonce_type;
   use type Types.nonce_type;
   use type Types.key_type;
   use type Types.key_type;
   use type Types.rel_time_type;
   use type Types.abs_time_type;
   use type Types.abs_time_type;
   pragma Warnings
     (On, "* already use-visible through previous use type clause");

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
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_authag_id
     (Id : Types.ae_id_type;
      authag_id : Types.authag_id_type)
      return Boolean
   is (Context_Array (Id).authag_id = authag_id);

   -------------------------------------------------------------------------

   function Has_ca_id
     (Id : Types.ae_id_type;
      ca_id : Types.ca_id_type)
      return Boolean
   is (Context_Array (Id).ca_id = ca_id);

   -------------------------------------------------------------------------

   function Has_cc_not_after
     (Id : Types.ae_id_type;
      cc_not_after : Types.abs_time_type)
      return Boolean
   is (Context_Array (Id).cc_not_after = cc_not_after);

   -------------------------------------------------------------------------

   function Has_cc_not_before
     (Id : Types.ae_id_type;
      cc_not_before : Types.abs_time_type)
      return Boolean
   is (Context_Array (Id).cc_not_before = cc_not_before);

   -------------------------------------------------------------------------

   function Has_creation_time
     (Id : Types.ae_id_type;
      creation_time : Types.rel_time_type)
      return Boolean
   is (Context_Array (Id).creation_time = creation_time);

   -------------------------------------------------------------------------

   function Has_dhag_id
     (Id : Types.ae_id_type;
      dhag_id : Types.dhag_id_type)
      return Boolean
   is (Context_Array (Id).dhag_id = dhag_id);

   -------------------------------------------------------------------------

   function Has_iag_id
     (Id : Types.ae_id_type;
      iag_id : Types.iag_id_type)
      return Boolean
   is (Context_Array (Id).iag_id = iag_id);

   -------------------------------------------------------------------------

   function Has_initiator
     (Id : Types.ae_id_type;
      initiator : Types.init_type)
      return Boolean
   is (Context_Array (Id).initiator = initiator);

   -------------------------------------------------------------------------

   function Has_lc_id
     (Id : Types.ae_id_type;
      lc_id : Types.lc_id_type)
      return Boolean
   is (Context_Array (Id).lc_id = lc_id);

   -------------------------------------------------------------------------

   function Has_nonce_loc
     (Id : Types.ae_id_type;
      nonce_loc : Types.nonce_type)
      return Boolean
   is (Context_Array (Id).nonce_loc = nonce_loc);

   -------------------------------------------------------------------------

   function Has_nonce_rem
     (Id : Types.ae_id_type;
      nonce_rem : Types.nonce_type)
      return Boolean
   is (Context_Array (Id).nonce_rem = nonce_rem);

   -------------------------------------------------------------------------

   function Has_ri_id
     (Id : Types.ae_id_type;
      ri_id : Types.ri_id_type)
      return Boolean
   is (Context_Array (Id).ri_id = ri_id);

   -------------------------------------------------------------------------

   function Has_sk_ike_auth_loc
     (Id : Types.ae_id_type;
      sk_ike_auth_loc : Types.key_type)
      return Boolean
   is (Context_Array (Id).sk_ike_auth_loc = sk_ike_auth_loc);

   -------------------------------------------------------------------------

   function Has_sk_ike_auth_rem
     (Id : Types.ae_id_type;
      sk_ike_auth_rem : Types.key_type)
      return Boolean
   is (Context_Array (Id).sk_ike_auth_rem = sk_ike_auth_rem);

   -------------------------------------------------------------------------

   function Has_State
     (Id : Types.ae_id_type;
      State : ae_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.ae_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure activate
     (Id : Types.ae_id_type)
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
   is
   begin
      return Context_Array (Id).lc_id;
   end get_lc_id;

   -------------------------------------------------------------------------

   function get_nonce_loc
     (Id : Types.ae_id_type)
      return Types.nonce_type
   is
   begin
      return Context_Array (Id).nonce_loc;
   end get_nonce_loc;

   -------------------------------------------------------------------------

   function get_nonce_rem
     (Id : Types.ae_id_type)
      return Types.nonce_type
   is
   begin
      return Context_Array (Id).nonce_rem;
   end get_nonce_rem;

   -------------------------------------------------------------------------

   function get_ri_id
     (Id : Types.ae_id_type)
      return Types.ri_id_type
   is
   begin
      return Context_Array (Id).ri_id;
   end get_ri_id;

   -------------------------------------------------------------------------

   function get_sk_ike_auth_loc
     (Id : Types.ae_id_type)
      return Types.key_type
   is
   begin
      return Context_Array (Id).sk_ike_auth_loc;
   end get_sk_ike_auth_loc;

   -------------------------------------------------------------------------

   function get_sk_ike_auth_rem
     (Id : Types.ae_id_type)
      return Types.key_type
   is
   begin
      return Context_Array (Id).sk_ike_auth_rem;
   end get_sk_ike_auth_rem;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.ae_id_type)
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   function is_initiator
     (Id : Types.ae_id_type)
      return Types.init_type
   is
   begin
      return Context_Array (Id).initiator;
   end is_initiator;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.ae_id_type)
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
   is
   begin
      Context_Array (Id).lc_id := lc_id;
      Context_Array (Id).State := loc_auth;
   end sign;

end Tkmrpc.Contexts.ae;
