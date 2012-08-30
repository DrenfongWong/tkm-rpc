package body Tkmrpc.Contexts.isa
is

   pragma Warnings
     (Off, "* already use-visible through previous use type clause");
   use type Types.isa_id_type;
   use type Types.ae_id_type;
   use type Types.ia_id_type;
   use type Types.key_type;
   use type Types.rel_time_type;
   use type Types.duration_type;
   pragma Warnings
     (On, "* already use-visible through previous use type clause");

   type isa_FSM_Type is record
      State : isa_State_Type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      sk_d : Types.key_type;
      creation_time : Types.rel_time_type;
      max_rekey_age : Types.duration_type;
   end record;
   --  IKE SA Context

   Null_isa_FSM : constant isa_FSM_Type
     := isa_FSM_Type'
      (State => clean,
       ae_id => Types.ae_id_type'First,
       ia_id => Types.ia_id_type'First,
       sk_d => Types.Null_key_type,
       creation_time => Types.rel_time_type'First,
       max_rekey_age => Types.duration_type'First);

   type Context_Array_Type is
     array (Types.isa_id_type) of isa_FSM_Type;

   Context_Array : Context_Array_Type := Context_Array_Type'
     (others => (Null_isa_FSM));

   -------------------------------------------------------------------------

   function Get_State
     (Id : Types.isa_id_type)
      return isa_State_Type
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_ae_id
     (Id : Types.isa_id_type;
      ae_id : Types.ae_id_type)
      return Boolean
   is (Context_Array (Id).ae_id = ae_id);

   -------------------------------------------------------------------------

   function Has_creation_time
     (Id : Types.isa_id_type;
      creation_time : Types.rel_time_type)
      return Boolean
   is (Context_Array (Id).creation_time = creation_time);

   -------------------------------------------------------------------------

   function Has_ia_id
     (Id : Types.isa_id_type;
      ia_id : Types.ia_id_type)
      return Boolean
   is (Context_Array (Id).ia_id = ia_id);

   -------------------------------------------------------------------------

   function Has_max_rekey_age
     (Id : Types.isa_id_type;
      max_rekey_age : Types.duration_type)
      return Boolean
   is (Context_Array (Id).max_rekey_age = max_rekey_age);

   -------------------------------------------------------------------------

   function Has_sk_d
     (Id : Types.isa_id_type;
      sk_d : Types.key_type)
      return Boolean
   is (Context_Array (Id).sk_d = sk_d);

   -------------------------------------------------------------------------

   function Has_State
     (Id : Types.isa_id_type;
      State : isa_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.isa_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.isa_id_type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      sk_d : Types.key_type;
      creation_time : Types.rel_time_type)
   is
   begin
      Context_Array (Id).ae_id := ae_id;
      Context_Array (Id).ia_id := ia_id;
      Context_Array (Id).sk_d := sk_d;
      Context_Array (Id).creation_time := creation_time;
      Context_Array (Id).State := active;
   end create;

   -------------------------------------------------------------------------

   function get_ae_id
     (Id : Types.isa_id_type)
      return Types.ae_id_type
   is
   begin
      return Context_Array (Id).ae_id;
   end get_ae_id;

   -------------------------------------------------------------------------

   function get_sk_d
     (Id : Types.isa_id_type)
      return Types.key_type
   is
   begin
      return Context_Array (Id).sk_d;
   end get_sk_d;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.isa_id_type)
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.isa_id_type)
   is
   begin
      Context_Array (Id).ae_id := Types.ae_id_type'First;
      Context_Array (Id).ia_id := Types.ia_id_type'First;
      Context_Array (Id).sk_d := Types.Null_key_type;
      Context_Array (Id).creation_time := Types.rel_time_type'First;
      Context_Array (Id).max_rekey_age := Types.duration_type'First;
      Context_Array (Id).State := clean;
   end reset;

end Tkmrpc.Contexts.isa;
