with Tkmrpc.Types;

package Tkmrpc.Contexts.cc
is

   type cc_State_Type is
      (clean,
       --  cc not defined.
       invalid,
       --  cc invalid.
       stale,
       --  cc stale.
       linked,
       --  cc linked.
       checked
       --  cc checked.
      );

   function Get_State
     (Id : Types.cc_id_type)
      return cc_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.cc_id_type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_authag_id
     (Id : Types.cc_id_type;
      authag_id : Types.authag_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  authag_id value.

   function Has_ca_id
     (Id : Types.cc_id_type;
      ca_id : Types.ca_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ca_id value.

   function Has_certificate
     (Id : Types.cc_id_type;
      certificate : Types.certificate_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  certificate value.

   function Has_not_after
     (Id : Types.cc_id_type;
      not_after : Types.abs_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  not_after value.

   function Has_not_before
     (Id : Types.cc_id_type;
      not_before : Types.abs_time_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  not_before value.

   function Has_ri_id
     (Id : Types.cc_id_type;
      ri_id : Types.ri_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ri_id value.

   function Has_State
     (Id : Types.cc_id_type;
      State : cc_State_Type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure add_certificate
     (Id : Types.cc_id_type;
      certificate : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, linked)),
     Post => Has_State (Id, Get_State (Id)'Old) and
             Has_certificate (Id, certificate) and
             Has_not_before (Id, not_before) and
             Has_not_after (Id, not_after);

   procedure check
     (Id : Types.cc_id_type;
      ca_id : Types.ca_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, linked)),
     Post => Has_State (Id, checked) and
             Has_ca_id (Id, ca_id);

   procedure create
     (Id : Types.cc_id_type;
      authag_id : Types.authag_id_type;
      ri_id : Types.ri_id_type;
      certificate : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, clean)),
     Post => Has_State (Id, linked) and
             Has_authag_id (Id, authag_id) and
             Has_ri_id (Id, ri_id) and
             Has_certificate (Id, certificate) and
             Has_not_before (Id, not_before) and
             Has_not_after (Id, not_after);

   function get_certificate
     (Id : Types.cc_id_type)
      return Types.certificate_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, linked)),
     Post => Has_certificate (Id, get_certificate'Result);

   function get_not_after
     (Id : Types.cc_id_type)
      return Types.abs_time_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, linked)),
     Post => Has_not_after (Id, get_not_after'Result);

   function get_not_before
     (Id : Types.cc_id_type)
      return Types.abs_time_type
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, linked)),
     Post => Has_not_before (Id, get_not_before'Result);

   procedure reset
     (Id : Types.cc_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, clean);

end Tkmrpc.Contexts.cc;
