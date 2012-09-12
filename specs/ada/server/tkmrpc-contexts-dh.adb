package body Tkmrpc.Contexts.dh
is

   pragma Warnings
     (Off, "* already use-visible through previous use type clause");
   use type Types.dh_id_type;
   use type Types.dha_id_type;
   use type Types.rel_time_type;
   use type Types.dh_priv_type;
   use type Types.dh_key_type;
   pragma Warnings
     (On, "* already use-visible through previous use type clause");

   type dh_FSM_Type is record
      State : dh_State_Type;
      dha_id : Types.dha_id_type;
      creation_time : Types.rel_time_type;
      priv : Types.dh_priv_type;
      key : Types.dh_key_type;
   end record;
   --  Diffie Hellman Context

   Null_dh_FSM : constant dh_FSM_Type
     := dh_FSM_Type'
      (State => clean,
       dha_id => Types.dha_id_type'First,
       creation_time => Types.rel_time_type'First,
       priv => Types.Null_dh_priv_type,
       key => Types.Null_dh_key_type);

   type Context_Array_Type is
     array (Types.dh_id_type) of dh_FSM_Type;

   Context_Array : Context_Array_Type := Context_Array_Type'
     (others => (Null_dh_FSM));

   -------------------------------------------------------------------------

   function Get_State
     (Id : Types.dh_id_type)
      return dh_State_Type
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_creation_time
     (Id : Types.dh_id_type;
      creation_time : Types.rel_time_type)
      return Boolean
   is (Context_Array (Id).creation_time = creation_time);

   -------------------------------------------------------------------------

   function Has_dha_id
     (Id : Types.dh_id_type;
      dha_id : Types.dha_id_type)
      return Boolean
   is (Context_Array (Id).dha_id = dha_id);

   -------------------------------------------------------------------------

   function Has_key
     (Id : Types.dh_id_type;
      key : Types.dh_key_type)
      return Boolean
   is (Context_Array (Id).key = key);

   -------------------------------------------------------------------------

   function Has_priv
     (Id : Types.dh_id_type;
      priv : Types.dh_priv_type)
      return Boolean
   is (Context_Array (Id).priv = priv);

   -------------------------------------------------------------------------

   function Has_State
     (Id : Types.dh_id_type;
      State : dh_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.dh_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure consume
     (Id : Types.dh_id_type;
      dh_key : out Types.dh_key_type)
   is
   begin
      dh_key := Context_Array (Id).key;
      Context_Array (Id).dha_id := Types.dha_id_type'First;
      Context_Array (Id).creation_time := Types.rel_time_type'First;
      Context_Array (Id).priv := Types.Null_dh_priv_type;
      Context_Array (Id).key := Types.Null_dh_key_type;
      Context_Array (Id).State := clean;
   end consume;

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.dh_id_type;
      dha_id : Types.dha_id_type;
      secvalue : Types.dh_priv_type)
   is
   begin
      Context_Array (Id).dha_id := dha_id;
      Context_Array (Id).priv := secvalue;
      Context_Array (Id).State := created;
   end create;

   -------------------------------------------------------------------------

   procedure generate
     (Id : Types.dh_id_type;
      dh_key : Types.dh_key_type;
      timestamp : Types.rel_time_type)
   is
   begin
      Context_Array (Id).key := dh_key;
      Context_Array (Id).creation_time := timestamp;
      Context_Array (Id).priv := Types.Null_dh_priv_type;
      Context_Array (Id).State := generated;
   end generate;

   -------------------------------------------------------------------------

   function get_dha_id
     (Id : Types.dh_id_type)
      return Types.dha_id_type
   is
   begin
      return Context_Array (Id).dha_id;
   end get_dha_id;

   -------------------------------------------------------------------------

   function get_secvalue
     (Id : Types.dh_id_type)
      return Types.dh_priv_type
   is
   begin
      return Context_Array (Id).priv;
   end get_secvalue;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.dh_id_type)
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.dh_id_type)
   is
   begin
      Context_Array (Id).dha_id := Types.dha_id_type'First;
      Context_Array (Id).creation_time := Types.rel_time_type'First;
      Context_Array (Id).priv := Types.Null_dh_priv_type;
      Context_Array (Id).key := Types.Null_dh_key_type;
      Context_Array (Id).State := clean;
   end reset;

end Tkmrpc.Contexts.dh;
