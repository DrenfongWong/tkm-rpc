with Tkmrpc.Types;

package Tkmrpc.Contexts.Dh is

   type Dh_State_Type is (
     Clean,
   --  No nonce present.
     Invalid,
   --  Error state.
     Stale,
   --  DH Context stale.
     Created,
   --  Waiting for remote pubvalue.
     Generated
   --  Ready.
     );

   function Get_State (Id : Types.Dh_Id_Type) return Dh_State_Type
   with
     Pre => Is_Valid (Id);

   function Is_Valid (Id : Types.Dh_Id_Type) return Boolean;
   --  Returns True if the given id has a valid value.

   function Has_Creation_Time
     (Id            : Types.Dh_Id_Type;
      Creation_Time : Types.Rel_Time_Type)
      return          Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  creation_time value.

   function Has_Dha_Id
     (Id     : Types.Dh_Id_Type;
      Dha_Id : Types.Dha_Id_Type)
      return   Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  dha_id value.

   function Has_Key
     (Id   : Types.Dh_Id_Type;
      Key  : Types.Dh_Key_Type)
      return Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  key value.

   function Has_Priv
     (Id   : Types.Dh_Id_Type;
      Priv : Types.Dh_Priv_Type)
      return Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  priv value.

   function Has_State
     (Id    : Types.Dh_Id_Type;
      State : Dh_State_Type)
      return  Boolean
   with
     Pre => Is_Valid (Id);
   --  Returns True if the context specified by id has the given
   --  State value.

   procedure Consume
     (Id     : Types.Dh_Id_Type;
      Dh_Key : out Types.Dh_Key_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Generated)),
     Post => Has_State (Id, Clean);

   procedure Create
     (Id       : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Secvalue : Types.Dh_Priv_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Clean)),
     Post => Has_State (Id, Created) and
             Has_Dha_Id (Id, Dha_Id) and
             Has_Priv (Id, Secvalue);

   procedure Generate
     (Id        : Types.Dh_Id_Type;
      Dh_Key    : Types.Dh_Key_Type;
      Timestamp : Types.Rel_Time_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Created)),
     Post => Has_State (Id, Generated) and
             Has_Key (Id, Dh_Key) and
             Has_Creation_Time (Id, Timestamp);

   function Get_Dha_Id (Id : Types.Dh_Id_Type) return Types.Dha_Id_Type
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Created)),
     Post => Has_Dha_Id (Id, Get_Dha_Id'Result);

   function Get_Secvalue (Id : Types.Dh_Id_Type) return Types.Dh_Priv_Type
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Created)),
     Post => Has_Priv (Id, Get_Secvalue'Result);

   function Get_Shared_Secret
     (Id   : Types.Dh_Id_Type)
      return Types.Dh_Key_Type
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Generated)),
     Post => Has_Key (Id, Get_Shared_Secret'Result);

   procedure Invalidate (Id : Types.Dh_Id_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Clean) or
             Has_State (Id, Created) or
             Has_State (Id, Generated) or
             Has_State (Id, Invalid) or
             Has_State (Id, Stale)),
     Post => Has_State (Id, Invalid);

   procedure Reset (Id : Types.Dh_Id_Type)
   with
     Pre  => Is_Valid (Id) and then
            (Has_State (Id, Clean) or
             Has_State (Id, Created) or
             Has_State (Id, Generated) or
             Has_State (Id, Invalid) or
             Has_State (Id, Stale)),
     Post => Has_State (Id, Clean);

end Tkmrpc.Contexts.Dh;
