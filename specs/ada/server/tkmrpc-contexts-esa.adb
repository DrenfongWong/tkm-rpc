package body Tkmrpc.Contexts.esa
is

   pragma Warnings
     (Off, "* already use-visible through previous use type clause");
   use type Types.esa_id_type;
   use type Types.ae_id_type;
   use type Types.ea_id_type;
   use type Types.sp_id_type;
   pragma Warnings
     (On, "* already use-visible through previous use type clause");

   type esa_FSM_Type is record
      State : esa_State_Type;
      ae_id : Types.ae_id_type;
      ea_id : Types.ea_id_type;
      sp_id : Types.sp_id_type;
   end record;
   --  ESP SA Context

   Null_esa_FSM : constant esa_FSM_Type
     := esa_FSM_Type'
      (State => clean,
       ae_id => Types.ae_id_type'First,
       ea_id => Types.ea_id_type'First,
       sp_id => Types.sp_id_type'First);

   type Context_Array_Type is
     array (Types.esa_id_type) of esa_FSM_Type;

   Context_Array : Context_Array_Type := Context_Array_Type'
     (others => (Null_esa_FSM));

   -------------------------------------------------------------------------

   function Get_State
     (Id : Types.esa_id_type)
      return esa_State_Type
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_ae_id
     (Id : Types.esa_id_type;
      ae_id : Types.ae_id_type)
      return Boolean
   is (Context_Array (Id).ae_id = ae_id);

   -------------------------------------------------------------------------

   function Has_ea_id
     (Id : Types.esa_id_type;
      ea_id : Types.ea_id_type)
      return Boolean
   is (Context_Array (Id).ea_id = ea_id);

   -------------------------------------------------------------------------

   function Has_sp_id
     (Id : Types.esa_id_type;
      sp_id : Types.sp_id_type)
      return Boolean
   is (Context_Array (Id).sp_id = sp_id);

   -------------------------------------------------------------------------

   function Has_State
     (Id : Types.esa_id_type;
      State : esa_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.esa_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.esa_id_type;
      ae_id : Types.ae_id_type;
      ea_id : Types.ea_id_type;
      sp_id : Types.sp_id_type)
   is
   begin
      Context_Array (Id).ae_id := ae_id;
      Context_Array (Id).ea_id := ea_id;
      Context_Array (Id).sp_id := sp_id;
      Context_Array (Id).State := active;
   end create;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.esa_id_type)
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.esa_id_type)
   is
   begin
      Context_Array (Id).ae_id := Types.ae_id_type'First;
      Context_Array (Id).ea_id := Types.ea_id_type'First;
      Context_Array (Id).sp_id := Types.sp_id_type'First;
      Context_Array (Id).State := clean;
   end reset;

   -------------------------------------------------------------------------

   procedure select_sa
     (Id : Types.esa_id_type)
   is
   begin
      Context_Array (Id).State := selected;
   end select_sa;

   -------------------------------------------------------------------------

   procedure unselect_sa
     (Id : Types.esa_id_type)
   is
   begin
      Context_Array (Id).State := active;
   end unselect_sa;

end Tkmrpc.Contexts.esa;
