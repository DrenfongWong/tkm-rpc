package body Tkmrpc.Contexts.esa
--# own State is Context_Array;
is

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
   --# global Context_Array;
   --# return Context_Array (Id).State;
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.esa_id_type;
      ae_id : Types.ae_id_type;
      ea_id : Types.ea_id_type;
      sp_id : Types.sp_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          ae_id,
   --#          ea_id,
   --#          sp_id;
   --# pre
   --#   Context_Array (Id).State = clean;
   --# post
   --#   Context_Array (Id).State = active;
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
     (Id : Types.esa_id_type)
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
      Context_Array (Id).ea_id := Types.ea_id_type'First;
      Context_Array (Id).sp_id := Types.sp_id_type'First;
      Context_Array (Id).State := clean;
   end reset;

   -------------------------------------------------------------------------

   procedure select_sa
     (Id : Types.esa_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# pre
   --#   Context_Array (Id).State = active;
   --# post
   --#   Context_Array (Id).State = selected;
   is
   begin
      Context_Array (Id).State := selected;
   end select_sa;

   -------------------------------------------------------------------------

   procedure unselect_sa
     (Id : Types.esa_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id;
   --# pre
   --#   Context_Array (Id).State = selected;
   --# post
   --#   Context_Array (Id).State = active;
   is
   begin
      Context_Array (Id).State := active;
   end unselect_sa;

end Tkmrpc.Contexts.esa;
