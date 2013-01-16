with Tkmrpc.Types;

--# inherit
--#    Tkmrpc.Types;

package Tkmrpc.Contexts.cc
--# own State : State_Type;
--# initializes State;
is

   --# type State_Type is abstract;

   type cc_State_Type is
      (clean,
       --  Initial clean state.
       invalid,
       --  Error state.
       stale,
       --  CC context is stale.
       linked,
       --  CC is linked.
       checked
       --  CC has been checked and verified.
      );

   function Get_State
     (Id : Types.cc_id_type)
      return cc_State_Type;
   --# global State;

   procedure add_certificate
     (Id : Types.cc_id_type;
      certificate : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          certificate,
   --#          not_before,
   --#          not_after;

   procedure check
     (Id : Types.cc_id_type;
      ca_id : Types.ca_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          ca_id;

   procedure create
     (Id : Types.cc_id_type;
      authag_id : Types.authag_id_type;
      ri_id : Types.ri_id_type;
      certificate : Types.certificate_type;
      last_cert : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id,
   --#          authag_id,
   --#          ri_id,
   --#          certificate,
   --#          last_cert,
   --#          not_before,
   --#          not_after;

   function get_certificate
     (Id : Types.cc_id_type)
      return Types.certificate_type;
   --# global State;

   function get_last_cert
     (Id : Types.cc_id_type)
      return Types.certificate_type;
   --# global State;

   function get_not_after
     (Id : Types.cc_id_type)
      return Types.abs_time_type;
   --# global State;

   function get_not_before
     (Id : Types.cc_id_type)
      return Types.abs_time_type;
   --# global State;

   function get_remote_id
     (Id : Types.cc_id_type)
      return Types.ri_id_type;
   --# global State;

   procedure invalidate
     (Id : Types.cc_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

   procedure reset
     (Id : Types.cc_id_type);
   --# global in out State;
   --# derives
   --#    State
   --#       from
   --#          State,
   --#          Id;

end Tkmrpc.Contexts.cc;
