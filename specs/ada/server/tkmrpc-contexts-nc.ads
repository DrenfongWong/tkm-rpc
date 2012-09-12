with Tkmrpc.Types;

package Tkmrpc.Contexts.nc
is

   type nc_State_Type is
      (clean,
       --  No nonce present.
       invalid,
       --  Error state.
       created
       --  Nonce available.
      );

   function Get_State
     (Id : Types.nc_id_type)
      return nc_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.nc_id_type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_nonce
     (Id : Types.nc_id_type;
      nonce : Types.nonce_type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  nonce value.

   function Has_State
     (Id : Types.nc_id_type;
      State : nc_State_Type)
      return Boolean
   with
      Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure consume
     (Id : Types.nc_id_type;
      nonce : out Types.nonce_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, created)),
     Post => Has_State (Id, clean);

   procedure create
     (Id : Types.nc_id_type;
      nonce : Types.nonce_type)
   with
     Pre => Is_Valid (Id) and then
           (Has_State (Id, clean)),
     Post => Has_State (Id, created) and
             Has_nonce (Id, nonce);

   procedure invalidate
     (Id : Types.nc_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, invalid);

   procedure reset
     (Id : Types.nc_id_type)
   with
     Pre => Is_Valid (Id),
     Post => Has_State (Id, clean);

end Tkmrpc.Contexts.nc;
