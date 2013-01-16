package body Tkmrpc.Contexts.dh
--# own State is Context_Array;
is

   type dh_FSM_Type is record
      State : dh_State_Type;
      dha_id : Types.dha_id_type;
      creation_time : Types.rel_time_type;
      priv : Types.dh_priv_type;
      key : Types.dh_key_type;
   end record;
   --  Diffie-Hellman Context

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
   --# global Context_Array;
   --# return Context_Array (Id).State;
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   procedure consume
     (Id : Types.dh_id_type;
      dh_key : out Types.dh_key_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array,
   --#    dh_key
   --#       from
   --#          Context_Array,
   --#          Id;
   --# pre
   --#   Context_Array (Id).State = generated;
   --# post
   --#   Context_Array (Id).State = clean;
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
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          dha_id,
   --#          secvalue;
   --# pre
   --#   Context_Array (Id).State = clean;
   --# post
   --#   Context_Array (Id).State = created;
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
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          dh_key,
   --#          timestamp;
   --# pre
   --#   Context_Array (Id).State = created;
   --# post
   --#   Context_Array (Id).State = generated;
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
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = created;
   --# return Context_Array (Id).dha_id;
   is
   begin
      return Context_Array (Id).dha_id;
   end get_dha_id;

   -------------------------------------------------------------------------

   function get_secvalue
     (Id : Types.dh_id_type)
      return Types.dh_priv_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = created;
   --# return Context_Array (Id).priv;
   is
   begin
      return Context_Array (Id).priv;
   end get_secvalue;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.dh_id_type)
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
     (Id : Types.dh_id_type)
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
      Context_Array (Id).dha_id := Types.dha_id_type'First;
      Context_Array (Id).creation_time := Types.rel_time_type'First;
      Context_Array (Id).priv := Types.Null_dh_priv_type;
      Context_Array (Id).key := Types.Null_dh_key_type;
      Context_Array (Id).State := clean;
   end reset;

end Tkmrpc.Contexts.dh;
