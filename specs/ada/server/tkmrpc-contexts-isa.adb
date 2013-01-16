package body Tkmrpc.Contexts.isa
--# own State is Context_Array;
is

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
   --# global Context_Array;
   --# return Context_Array (Id).State;
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.isa_id_type;
      ae_id : Types.ae_id_type;
      ia_id : Types.ia_id_type;
      sk_d : Types.key_type;
      creation_time : Types.rel_time_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          ae_id,
   --#          ia_id,
   --#          sk_d,
   --#          creation_time;
   --# pre
   --#   Context_Array (Id).State = clean;
   --# post
   --#   Context_Array (Id).State = active;
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
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = active;
   --# return Context_Array (Id).ae_id;
   is
   begin
      return Context_Array (Id).ae_id;
   end get_ae_id;

   -------------------------------------------------------------------------

   function get_sk_d
     (Id : Types.isa_id_type)
      return Types.key_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = active;
   --# return Context_Array (Id).sk_d;
   is
   begin
      return Context_Array (Id).sk_d;
   end get_sk_d;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.isa_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# post
   --#   Context_Array (Id).State = invalid;
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.isa_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# post
   --#   Context_Array (Id).State = clean;
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
