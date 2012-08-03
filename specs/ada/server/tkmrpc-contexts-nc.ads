with Tkmrpc.Types;

package Tkmrpc.Contexts.Nc is

   type Nc_State_Type is (
     Clean,
   --  No nonce present.
     Invalid,
   --  Error state.
     Created
   --  Nonce available.
     );

   function Get_State (Id : Types.Nc_Id_Type) return Nc_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.Nc_Id_Type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_Nonce
     (Id    : Types.Nc_Id_Type;
      Nonce : Types.Nonce_Type)
      return Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  nonce value.

   function Has_State
     (Id    : Types.Nc_Id_Type;
      State : Nc_State_Type)
      return Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure Consume (Id : Types.Nc_Id_Type; Nonce : out Types.Nonce_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Created)),
     Post => Has_State (Id, Clean);

   procedure Create (Id : Types.Nc_Id_Type; Nonce : Types.Nonce_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Clean)),
     Post => Has_State (Id, Created) and
             Has_Nonce (Id, Nonce);

   procedure Invalidate (Id : Types.Nc_Id_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Clean) or
             Has_State (Id, Created) or
             Has_State (Id, Invalid)),
     Post => Has_State (Id, Invalid);

   procedure Reset (Id : Types.Nc_Id_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Clean) or
             Has_State (Id, Created) or
             Has_State (Id, Invalid)),
     Post => Has_State (Id, Clean);

end Tkmrpc.Contexts.Nc;
