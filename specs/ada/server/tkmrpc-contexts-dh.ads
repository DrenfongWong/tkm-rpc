with Tkmrpc.Types;

package Tkmrpc.Contexts.dh
is

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
      return dh_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.dh_id_type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_creation_time
     (Id : Types.dh_id_type;
      creation_time : Types.rel_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  creation_time value.

   function Has_dha_id
     (Id : Types.dh_id_type;
      dha_id : Types.dha_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  dha_id value.

   function Has_key
     (Id : Types.dh_id_type;
      key : Types.dh_key_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  key value.

   function Has_priv
     (Id : Types.dh_id_type;
      priv : Types.dh_priv_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  priv value.

   function Has_State
     (Id : Types.dh_id_type;
      State : dh_State_Type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure consume
     (Id : Types.dh_id_type;
      dh_key : out Types.dh_key_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, generated)),
     Post => Has_State (Id, clean);

   procedure create
     (Id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      secvalue : Types.dh_priv_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, clean)),
     Post => Has_State (Id, created) and
             Has_dha_id (Id, dha_id) and
             Has_priv (Id, secvalue);

   procedure generate
     (Id : Types.dh_id_type;
      dh_key : Types.dh_key_type;
      timestamp : Types.rel_time_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, created)),
     Post => Has_State (Id, generated) and
             Has_key (Id, dh_key) and
             Has_creation_time (Id, timestamp);

   function get_dha_id
     (Id : Types.dh_id_type)
      return Types.dha_id_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, created)),
     Post => Has_dha_id (Id, get_dha_id'Result);

   function get_secvalue
     (Id : Types.dh_id_type)
      return Types.dh_priv_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, created)),
     Post => Has_priv (Id, get_secvalue'Result);

   procedure invalidate
     (Id : Types.dh_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, invalid);

   procedure reset
     (Id : Types.dh_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, clean);

end Tkmrpc.Contexts.dh;
