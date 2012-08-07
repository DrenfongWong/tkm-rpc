package body Tkmrpc.Contexts.Dh is

   pragma Warnings
     (Off,
      "* already use-visible through previous use type clause");
   use type Types.Dh_Id_Type;
   use type Types.Dha_Id_Type;
   use type Types.Rel_Time_Type;
   use type Types.Dh_Priv_Type;
   use type Types.Dh_Key_Type;
   pragma Warnings
     (On,
      "* already use-visible through previous use type clause");

   type Dh_Fsm_Type is record
      State         : Dh_State_Type;
      Dha_Id        : Types.Dha_Id_Type;
      Creation_Time : Types.Rel_Time_Type;
      Priv          : Types.Dh_Priv_Type;
      Key           : Types.Dh_Key_Type;
   end record;
   --  Diffie Hellman Context

   Null_Dh_Fsm : constant Dh_Fsm_Type :=
     Dh_Fsm_Type'
     (State         => Clean,
      Dha_Id        => Types.Dha_Id_Type'First,
      Creation_Time => Types.Rel_Time_Type'First,
      Priv          => Types.Null_Dh_Priv_Type,
      Key           => Types.Null_Dh_Key_Type);

   type Context_Array_Type is array (Types.Dh_Id_Type) of Dh_Fsm_Type;

   Context_Array : Context_Array_Type :=
     Context_Array_Type'(others => (Null_Dh_Fsm));

   -------------------------------------------------------------------------

   procedure Consume
     (Id     :     Types.Dh_Id_Type;
      Dh_Key : out Types.Dh_Key_Type)
   is
   begin
      Dh_Key                           := Context_Array (Id).Key;
      Context_Array (Id).Dha_Id        := Types.Dha_Id_Type'First;
      Context_Array (Id).Creation_Time := Types.Rel_Time_Type'First;
      Context_Array (Id).Priv          := Types.Null_Dh_Priv_Type;
      Context_Array (Id).Key           := Types.Null_Dh_Key_Type;
      Context_Array (Id).State         := Clean;
   end Consume;

   -------------------------------------------------------------------------

   procedure Create
     (Id       : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Secvalue : Types.Dh_Priv_Type)
   is
   begin
      Context_Array (Id).Dha_Id := Dha_Id;
      Context_Array (Id).Priv   := Secvalue;
      Context_Array (Id).State  := Created;
   end Create;

   -------------------------------------------------------------------------

   procedure Generate
     (Id        : Types.Dh_Id_Type;
      Dh_Key    : Types.Dh_Key_Type;
      Timestamp : Types.Rel_Time_Type)
   is
   begin
      Context_Array (Id).Key           := Dh_Key;
      Context_Array (Id).Creation_Time := Timestamp;
      Context_Array (Id).Priv          := Types.Null_Dh_Priv_Type;
      Context_Array (Id).State         := Generated;
   end Generate;

   -------------------------------------------------------------------------

   function Get_Dha_Id (Id : Types.Dh_Id_Type) return Types.Dha_Id_Type is
   begin
      return Context_Array (Id).Dha_Id;
   end Get_Dha_Id;

   -------------------------------------------------------------------------

   function Get_Secvalue (Id : Types.Dh_Id_Type) return Types.Dh_Priv_Type is
   begin
      return Context_Array (Id).Priv;
   end Get_Secvalue;

   -------------------------------------------------------------------------

   function Get_Shared_Secret
     (Id   : Types.Dh_Id_Type)
      return Types.Dh_Key_Type
   is
   begin
      return Context_Array (Id).Key;
   end Get_Shared_Secret;

   -------------------------------------------------------------------------

   function Get_State (Id : Types.Dh_Id_Type) return Dh_State_Type is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_Creation_Time
     (Id            : Types.Dh_Id_Type;
      Creation_Time : Types.Rel_Time_Type)
      return Boolean
   is (Context_Array (Id).Creation_Time = Creation_Time);

   -------------------------------------------------------------------------

   function Has_Dha_Id
     (Id     : Types.Dh_Id_Type;
      Dha_Id : Types.Dha_Id_Type)
      return Boolean
   is (Context_Array (Id).Dha_Id = Dha_Id);

   -------------------------------------------------------------------------

   function Has_Key
     (Id  : Types.Dh_Id_Type;
      Key : Types.Dh_Key_Type)
      return Boolean
   is (Context_Array (Id).Key = Key);

   -------------------------------------------------------------------------

   function Has_Priv
     (Id   : Types.Dh_Id_Type;
      Priv : Types.Dh_Priv_Type)
      return Boolean
   is (Context_Array (Id).Priv = Priv);

   -------------------------------------------------------------------------

   function Has_State
     (Id    : Types.Dh_Id_Type;
      State : Dh_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   procedure Invalidate (Id : Types.Dh_Id_Type) is
   begin
      Context_Array (Id).State := Invalid;
   end Invalidate;

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.Dh_Id_Type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure Reset (Id : Types.Dh_Id_Type) is
   begin
      Context_Array (Id).Dha_Id        := Types.Dha_Id_Type'First;
      Context_Array (Id).Creation_Time := Types.Rel_Time_Type'First;
      Context_Array (Id).Priv          := Types.Null_Dh_Priv_Type;
      Context_Array (Id).Key           := Types.Null_Dh_Key_Type;
      Context_Array (Id).State         := Clean;
   end Reset;

end Tkmrpc.Contexts.Dh;
