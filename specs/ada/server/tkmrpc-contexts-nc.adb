package body Tkmrpc.Contexts.nc
--# own State is Context_Array;
is

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
   --# global Context_Array;
   --# return Context_Array (Id).State;
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   procedure consume
     (Id : Types.nc_id_type;
      nonce : out Types.nonce_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array,
   --#    nonce
   --#       from
   --#          Context_Array,
   --#          Id;
   --# pre
   --#   Context_Array (Id).State = created;
   --# post
   --#   Context_Array (Id).State = clean;
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
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          nonce;
   --# pre
   --#   Context_Array (Id).State = clean;
   --# post
   --#   Context_Array (Id).State = created;
   is
   begin
      Context_Array (Id).nonce := nonce;
      Context_Array (Id).State := created;
   end create;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.nc_id_type)
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
     (Id : Types.nc_id_type)
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
      Context_Array (Id).nonce := Types.Null_nonce_type;
      Context_Array (Id).State := clean;
   end reset;

end Tkmrpc.Contexts.nc;
