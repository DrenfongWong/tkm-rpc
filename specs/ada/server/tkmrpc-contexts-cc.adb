package body Tkmrpc.Contexts.cc
--# own State is Context_Array;
is

   type cc_FSM_Type is record
      State : cc_State_Type;
      certificate : Types.certificate_type;
      last_cert : Types.certificate_type;
      ca_id : Types.ca_id_type;
      ri_id : Types.ri_id_type;
      authag_id : Types.authag_id_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type;
   end record;
   --  Certificate Chain Context

   Null_cc_FSM : constant cc_FSM_Type
     := cc_FSM_Type'
      (State => clean,
       certificate => Types.Null_certificate_type,
       last_cert => Types.Null_certificate_type,
       ca_id => Types.ca_id_type'First,
       ri_id => Types.ri_id_type'First,
       authag_id => Types.authag_id_type'First,
       not_before => Types.abs_time_type'First,
       not_after => Types.abs_time_type'First);

   type Context_Array_Type is
     array (Types.cc_id_type) of cc_FSM_Type;

   Context_Array : Context_Array_Type := Context_Array_Type'
     (others => (Null_cc_FSM));

   -------------------------------------------------------------------------

   function Get_State
     (Id : Types.cc_id_type)
      return cc_State_Type
   --# global Context_Array;
   --# return Context_Array (Id).State;
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   procedure add_certificate
     (Id : Types.cc_id_type;
      certificate : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          certificate,
   --#          not_before,
   --#          not_after;
   --# pre
   --#   Context_Array (Id).State = linked;
   --# post
   --#   Context_Array (Id).State =  ~Context_Array (Id).State;
   is
   begin
      Context_Array (Id).last_cert := certificate;
      Context_Array (Id).not_before := not_before;
      Context_Array (Id).not_after := not_after;
   end add_certificate;

   -------------------------------------------------------------------------

   procedure check
     (Id : Types.cc_id_type;
      ca_id : Types.ca_id_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          ca_id;
   --# pre
   --#   Context_Array (Id).State = linked;
   --# post
   --#   Context_Array (Id).State = checked;
   is
   begin
      Context_Array (Id).ca_id := ca_id;
      Context_Array (Id).State := checked;
   end check;

   -------------------------------------------------------------------------

   procedure create
     (Id : Types.cc_id_type;
      authag_id : Types.authag_id_type;
      ri_id : Types.ri_id_type;
      certificate : Types.certificate_type;
      last_cert : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
   --# global in out Context_Array;
   --# derives
   --#    Context_Array
   --#       from
   --#          Context_Array,
   --#          Id,
   --#          authag_id,
   --#          ri_id,
   --#          certificate,
   --#          last_cert,
   --#          not_before,
   --#          not_after;
   --# pre
   --#   Context_Array (Id).State = clean;
   --# post
   --#   Context_Array (Id).State = linked;
   is
   begin
      Context_Array (Id).authag_id := authag_id;
      Context_Array (Id).ri_id := ri_id;
      Context_Array (Id).certificate := certificate;
      Context_Array (Id).last_cert := last_cert;
      Context_Array (Id).not_before := not_before;
      Context_Array (Id).not_after := not_after;
      Context_Array (Id).State := linked;
   end create;

   -------------------------------------------------------------------------

   function get_certificate
     (Id : Types.cc_id_type)
      return Types.certificate_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = checked;
   --# return Context_Array (Id).certificate;
   is
   begin
      return Context_Array (Id).certificate;
   end get_certificate;

   -------------------------------------------------------------------------

   function get_last_cert
     (Id : Types.cc_id_type)
      return Types.certificate_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = linked;
   --# return Context_Array (Id).last_cert;
   is
   begin
      return Context_Array (Id).last_cert;
   end get_last_cert;

   -------------------------------------------------------------------------

   function get_not_after
     (Id : Types.cc_id_type)
      return Types.abs_time_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = linked;
   --# return Context_Array (Id).not_after;
   is
   begin
      return Context_Array (Id).not_after;
   end get_not_after;

   -------------------------------------------------------------------------

   function get_not_before
     (Id : Types.cc_id_type)
      return Types.abs_time_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = linked;
   --# return Context_Array (Id).not_before;
   is
   begin
      return Context_Array (Id).not_before;
   end get_not_before;

   -------------------------------------------------------------------------

   function get_remote_id
     (Id : Types.cc_id_type)
      return Types.ri_id_type
   --# global Context_Array;
   --# pre
   --#   Context_Array (Id).State = checked;
   --# return Context_Array (Id).ri_id;
   is
   begin
      return Context_Array (Id).ri_id;
   end get_remote_id;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.cc_id_type)
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
     (Id : Types.cc_id_type)
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
      Context_Array (Id).ca_id := Types.ca_id_type'First;
      Context_Array (Id).authag_id := Types.authag_id_type'First;
      Context_Array (Id).ri_id := Types.ri_id_type'First;
      Context_Array (Id).certificate := Types.Null_certificate_type;
      Context_Array (Id).not_before := Types.abs_time_type'First;
      Context_Array (Id).not_after := Types.abs_time_type'First;
      Context_Array (Id).State := clean;
   end reset;

end Tkmrpc.Contexts.cc;
