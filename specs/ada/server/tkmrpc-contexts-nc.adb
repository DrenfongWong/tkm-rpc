package body Tkmrpc.Contexts.nc
is

   pragma Warnings
     (Off, "* already use-visible through previous use type clause");
   use type Types.nc_id_type;
   use type Types.nonce_type;
   pragma Warnings
     (On, "* already use-visible through previous use type clause");

   type nc_FSM_Type is record
      State : nc_State_Type;
      nonce : Types.nonce_type;
   end record;
   --  Nonce Context

   Null_nc_FSM : constant nc_FSM_Type
     := nc_FSM_Type'
      (State => clean,
       nonce => Types.Null_nonce_type);

   type Context_Array_Type is
     array (Types.nc_id_type) of nc_FSM_Type;

   Context_Array : Context_Array_Type := Context_Array_Type'
     (others => (Null_nc_FSM));

   -------------------------------------------------------------------------

   function Get_State
     (Id : Types.nc_id_type)
      return nc_State_Type
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_nonce
     (Id : Types.nc_id_type;
      nonce : Types.nonce_type)
      return Boolean
   is (Context_Array (Id).nonce = nonce);

   -------------------------------------------------------------------------

   function Has_State
     (Id : Types.nc_id_type;
      State : nc_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.nc_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure consume
     (Id : Types.nc_id_type;
      nonce : out Types.nonce_type)
   is
   begin
      nonce := Context_Array (Id).nonce;
      Context_Array (Id).nonce := Types.Null_nonce_type;
      Context_Array (Id).State := clean;
   end consume;

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.nc_id_type;
      nonce : Types.nonce_type)
   is
   begin
      Context_Array (Id).nonce := nonce;
      Context_Array (Id).State := created;
   end create;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.nc_id_type)
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.nc_id_type)
   is
   begin
      Context_Array (Id).nonce := Types.Null_nonce_type;
      Context_Array (Id).State := clean;
   end reset;

end Tkmrpc.Contexts.nc;
