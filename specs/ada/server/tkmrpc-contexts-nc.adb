package body Tkmrpc.Contexts.Nc is

   pragma Warnings
     (Off,
      "* already use-visible through previous use type clause");
   use type Types.Nc_Id_Type;
   use type Types.Nonce_Type;
   pragma Warnings
     (On,
      "* already use-visible through previous use type clause");

   type Nc_Fsm_Type is record
      State : Nc_State_Type;
      Nonce : Types.Nonce_Type;
   end record;
   --  Nonce Context

   Null_Nc_Fsm : constant Nc_Fsm_Type :=
     Nc_Fsm_Type'(State => Clean, Nonce => Types.Null_Nonce_Type);

   type Context_Array_Type is array (Types.Nc_Id_Type) of Nc_Fsm_Type;

   Context_Array : Context_Array_Type :=
     Context_Array_Type'(others => (Null_Nc_Fsm));

   -------------------------------------------------------------------------

   procedure Consume (Id : Types.Nc_Id_Type; Nonce : out Types.Nonce_Type) is
   begin
      Nonce                    := Context_Array (Id).Nonce;
      Context_Array (Id).Nonce := Types.Null_Nonce_Type;
      Context_Array (Id).State := Clean;
   end Consume;

   -------------------------------------------------------------------------

   procedure Create (Id : Types.Nc_Id_Type; Nonce : Types.Nonce_Type) is
   begin
      Context_Array (Id).Nonce := Nonce;
      Context_Array (Id).State := Created;
   end Create;

   -------------------------------------------------------------------------

   function Get_State (Id : Types.Nc_Id_Type) return Nc_State_Type is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_nonce
     (Id    : Types.Nc_Id_Type;
      Nonce : Types.Nonce_Type)
      return Boolean
   is (Context_Array (Id).Nonce = Nonce);

   -------------------------------------------------------------------------

   function Has_State
     (Id    : Types.Nc_Id_Type;
      State : Nc_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   procedure Invalidate (Id : Types.Nc_Id_Type) is
   begin
      Context_Array (Id).State := Invalid;
   end Invalidate;

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.nc_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure Reset (Id : Types.Nc_Id_Type) is
   begin
      Context_Array (Id).Nonce := Types.Null_Nonce_Type;
      Context_Array (Id).State := Clean;
   end Reset;

end Tkmrpc.Contexts.Nc;
