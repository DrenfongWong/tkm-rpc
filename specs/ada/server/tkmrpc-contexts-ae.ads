with Tkmrpc.Types;

package Tkmrpc.Contexts.ae
is

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
       rem_auth,
       --  Remote identity of AE is authenticated.
       authenticated,
       --  AE is authenticated.
       active
       --  AE is authenticated and in use.
      );

   function Get_State
     (Id : Types.ae_id_type)
      return ae_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.ae_id_type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_authag_id
     (Id : Types.ae_id_type;
      authag_id : Types.authag_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  authag_id value.

   function Has_ca_id
     (Id : Types.ae_id_type;
      ca_id : Types.ca_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ca_id value.

   function Has_cc_not_after
     (Id : Types.ae_id_type;
      cc_not_after : Types.abs_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  cc_not_after value.

   function Has_cc_not_before
     (Id : Types.ae_id_type;
      cc_not_before : Types.abs_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  cc_not_before value.

   function Has_creation_time
     (Id : Types.ae_id_type;
      creation_time : Types.rel_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  creation_time value.

   function Has_dhag_id
     (Id : Types.ae_id_type;
      dhag_id : Types.dhag_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  dhag_id value.

   function Has_iag_id
     (Id : Types.ae_id_type;
      iag_id : Types.iag_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  iag_id value.

   function Has_initiator
     (Id : Types.ae_id_type;
      initiator : Types.init_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  initiator value.

   function Has_lc_id
     (Id : Types.ae_id_type;
      lc_id : Types.lc_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  lc_id value.

   function Has_nonce_loc
     (Id : Types.ae_id_type;
      nonce_loc : Types.nonce_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  nonce_loc value.

   function Has_nonce_rem
     (Id : Types.ae_id_type;
      nonce_rem : Types.nonce_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  nonce_rem value.

   function Has_ri_id
     (Id : Types.ae_id_type;
      ri_id : Types.ri_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ri_id value.

   function Has_sk_ike_auth_loc
     (Id : Types.ae_id_type;
      sk_ike_auth_loc : Types.key_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  sk_ike_auth_loc value.

   function Has_sk_ike_auth_rem
     (Id : Types.ae_id_type;
      sk_ike_auth_rem : Types.key_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  sk_ike_auth_rem value.

   function Has_State
     (Id : Types.ae_id_type;
      State : ae_State_Type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure activate
     (Id : Types.ae_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, authenticated)),
     Post => Has_State (Id, active);

   procedure authenticate
     (Id : Types.ae_id_type;
      ca_context : Types.ca_id_type;
      ra_id : Types.authag_id_type;
      remote_identity : Types.ri_id_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, loc_auth)),
     Post => Has_State (Id, authenticated) and
             Has_ca_id (Id, ca_context) and
             Has_authag_id (Id, ra_id) and
             Has_ri_id (Id, remote_identity) and
             Has_cc_not_before (Id, not_before) and
             Has_cc_not_after (Id, not_after);

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
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, clean)),
     Post => Has_State (Id, unauth) and
             Has_iag_id (Id, iag_id) and
             Has_dhag_id (Id, dhag_id) and
             Has_creation_time (Id, creation_time) and
             Has_initiator (Id, initiator) and
             Has_sk_ike_auth_loc (Id, sk_ike_auth_loc) and
             Has_sk_ike_auth_rem (Id, sk_ike_auth_rem) and
             Has_nonce_loc (Id, nonce_loc) and
             Has_nonce_rem (Id, nonce_rem);

   function get_nonce_loc
     (Id : Types.ae_id_type)
      return Types.nonce_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active) or
            Has_State (Id, authenticated) or
            Has_State (Id, loc_auth) or
            Has_State (Id, rem_auth) or
            Has_State (Id, unauth)),
     Post => Has_nonce_loc (Id, get_nonce_loc'Result);

   function get_nonce_rem
     (Id : Types.ae_id_type)
      return Types.nonce_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active) or
            Has_State (Id, authenticated) or
            Has_State (Id, loc_auth) or
            Has_State (Id, rem_auth) or
            Has_State (Id, unauth)),
     Post => Has_nonce_rem (Id, get_nonce_rem'Result);

   function get_sk_ike_auth_loc
     (Id : Types.ae_id_type)
      return Types.key_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active) or
            Has_State (Id, authenticated) or
            Has_State (Id, loc_auth) or
            Has_State (Id, rem_auth) or
            Has_State (Id, unauth)),
     Post => Has_sk_ike_auth_loc (Id, get_sk_ike_auth_loc'Result);

   function get_sk_ike_auth_rem
     (Id : Types.ae_id_type)
      return Types.key_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active) or
            Has_State (Id, authenticated) or
            Has_State (Id, loc_auth) or
            Has_State (Id, rem_auth) or
            Has_State (Id, unauth)),
     Post => Has_sk_ike_auth_rem (Id, get_sk_ike_auth_rem'Result);

   procedure invalidate
     (Id : Types.ae_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, invalid);

   function is_initiator
     (Id : Types.ae_id_type)
      return Types.init_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active) or
            Has_State (Id, authenticated) or
            Has_State (Id, loc_auth) or
            Has_State (Id, rem_auth) or
            Has_State (Id, unauth)),
     Post => Has_initiator (Id, is_initiator'Result);

   procedure reset
     (Id : Types.ae_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, clean);

   procedure sign
     (Id : Types.ae_id_type;
      lc_id : Types.lc_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, unauth)),
     Post => Has_State (Id, loc_auth) and
             Has_lc_id (Id, lc_id);

end Tkmrpc.Contexts.ae;
