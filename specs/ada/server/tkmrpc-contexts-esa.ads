with Tkmrpc.Types;

package Tkmrpc.Contexts.esa
is

   type esa_State_Type is
      (clean,
       --  esa not defined.
       invalid,
       --  esa invalid.
       stale,
       --  esa stale.
       selected,
       --  esa selected.
       active
       --  esa active.
      );

   function Get_State
     (Id : Types.esa_id_type)
      return esa_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.esa_id_type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_ae_id
     (Id : Types.esa_id_type;
      ae_id : Types.ae_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ae_id value.

   function Has_ea_id
     (Id : Types.esa_id_type;
      ea_id : Types.ea_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  ea_id value.

   function Has_sp_id
     (Id : Types.esa_id_type;
      sp_id : Types.sp_id_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  sp_id value.

   function Has_State
     (Id : Types.esa_id_type;
      State : esa_State_Type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure create
     (Id : Types.esa_id_type;
      ae_id : Types.ae_id_type;
      ea_id : Types.ea_id_type;
      sp_id : Types.sp_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, clean)),
     Post => Has_State (Id, active) and
             Has_ae_id (Id, ae_id) and
             Has_ea_id (Id, ea_id) and
             Has_sp_id (Id, sp_id);

   procedure reset
     (Id : Types.esa_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, invalid) or
            Has_State (Id, stale) or
            Has_State (Id, active) or
            Has_State (Id, selected)),
     Post => Has_State (Id, clean);

   procedure select_sa
     (Id : Types.esa_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, active)),
     Post => Has_State (Id, selected);

   procedure unselect_sa
     (Id : Types.esa_id_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, selected)),
     Post => Has_State (Id, active);

end Tkmrpc.Contexts.esa;
