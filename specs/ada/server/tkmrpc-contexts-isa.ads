with Tkmrpc.Types;

package Tkmrpc.Contexts.isa
is

   type isa_State_Type is
      (clean,
       --  isa not defined.
       invalid,
       --  isa invalid.
       stale,
       --  isa stale.
       active
       --  isa active.
      );

   function Get_State
     (Id : Types.isa_id_type)
      return isa_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.isa_id_type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_ae_id
     (Id : Types.isa_id_type;
      ae_id : Types.ae_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ae_id value.

   function Has_creation_time
     (Id : Types.isa_id_type;
      creation_time : Types.rel_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  creation_time value.

   function Has_ia_id
     (Id : Types.isa_id_type;
      ia_id : Types.ia_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ia_id value.

   function Has_max_rekey_age
     (Id : Types.isa_id_type;
      max_rekey_age : Types.duration_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  max_rekey_age value.

   function Has_sk_d
     (Id : Types.isa_id_type;
      sk_d : Types.key_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  sk_d value.

   function Has_State
     (Id : Types.isa_id_type;
      State : isa_State_Type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure create
     (Id : Types.isa_id_type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      sk_d : Types.key_type;
      creation_time : Types.rel_time_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, clean)),
     Post => Has_State (Id, active) and
             Has_ae_id (Id, ae_id) and
             Has_ia_id (Id, ia_id) and
             Has_sk_d (Id, sk_d) and
             Has_creation_time (Id, creation_time);

   function get_ae_id
     (Id : Types.isa_id_type)
      return Types.ae_id_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active)),
     Post => Has_ae_id (Id, get_ae_id'Result);

   function get_sk_d
     (Id : Types.isa_id_type)
      return Types.key_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active)),
     Post => Has_sk_d (Id, get_sk_d'Result);

   procedure invalidate
     (Id : Types.isa_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, invalid);

   procedure reset
     (Id : Types.isa_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, clean);

end Tkmrpc.Contexts.isa;
