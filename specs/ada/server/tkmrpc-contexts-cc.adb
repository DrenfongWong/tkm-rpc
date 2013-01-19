package body Tkmrpc.Contexts.cc
is

   pragma Warnings
     (Off, "* already use-visible through previous use type clause");
   use type Types.cc_id_type;
   use type Types.certificate_type;
   use type Types.certificate_type;
   use type Types.ca_id_type;
   use type Types.ri_id_type;
   use type Types.authag_id_type;
   use type Types.abs_time_type;
   use type Types.abs_time_type;
   pragma Warnings
     (On, "* already use-visible through previous use type clause");

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
   is
   begin
      return Context_Array (Id).State;
   end Get_State;

   -------------------------------------------------------------------------

   function Has_authag_id
     (Id : Types.cc_id_type;
      authag_id : Types.authag_id_type)
      return Boolean
   is (Context_Array (Id).authag_id = authag_id);

   -------------------------------------------------------------------------

   function Has_ca_id
     (Id : Types.cc_id_type;
      ca_id : Types.ca_id_type)
      return Boolean
   is (Context_Array (Id).ca_id = ca_id);

   -------------------------------------------------------------------------

   function Has_certificate
     (Id : Types.cc_id_type;
      certificate : Types.certificate_type)
      return Boolean
   is (Context_Array (Id).certificate = certificate);

   -------------------------------------------------------------------------

   function Has_last_cert
     (Id : Types.cc_id_type;
      last_cert : Types.certificate_type)
      return Boolean
   is (Context_Array (Id).last_cert = last_cert);

   -------------------------------------------------------------------------

   function Has_not_after
     (Id : Types.cc_id_type;
      not_after : Types.abs_time_type)
      return Boolean
   is (Context_Array (Id).not_after = not_after);

   -------------------------------------------------------------------------

   function Has_not_before
     (Id : Types.cc_id_type;
      not_before : Types.abs_time_type)
      return Boolean
   is (Context_Array (Id).not_before = not_before);

   -------------------------------------------------------------------------

   function Has_ri_id
     (Id : Types.cc_id_type;
      ri_id : Types.ri_id_type)
      return Boolean
   is (Context_Array (Id).ri_id = ri_id);

   -------------------------------------------------------------------------

   function Has_State
     (Id : Types.cc_id_type;
      State : cc_State_Type)
      return Boolean
   is (Context_Array (Id).State = State);

   -------------------------------------------------------------------------

   pragma Warnings
     (Off, "condition can only be False if invalid values present");
   function Is_Valid (Id : Types.cc_id_type) return Boolean
   is (Context_Array'First <= Id and Id <= Context_Array'Last);
   pragma Warnings
     (On, "condition can only be False if invalid values present");

   -------------------------------------------------------------------------

   procedure add_certificate
     (Id : Types.cc_id_type;
      certificate : Types.certificate_type;
      not_before : Types.abs_time_type;
      not_after : Types.abs_time_type)
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
   is
   begin
      return Context_Array (Id).certificate;
   end get_certificate;

   -------------------------------------------------------------------------

   function get_last_cert
     (Id : Types.cc_id_type)
      return Types.certificate_type
   is
   begin
      return Context_Array (Id).last_cert;
   end get_last_cert;

   -------------------------------------------------------------------------

   function get_not_after
     (Id : Types.cc_id_type)
      return Types.abs_time_type
   is
   begin
      return Context_Array (Id).not_after;
   end get_not_after;

   -------------------------------------------------------------------------

   function get_not_before
     (Id : Types.cc_id_type)
      return Types.abs_time_type
   is
   begin
      return Context_Array (Id).not_before;
   end get_not_before;

   -------------------------------------------------------------------------

   function get_remote_id
     (Id : Types.cc_id_type)
      return Types.ri_id_type
   is
   begin
      return Context_Array (Id).ri_id;
   end get_remote_id;

   -------------------------------------------------------------------------

   procedure invalidate
     (Id : Types.cc_id_type)
   is
   begin
      Context_Array (Id).State := invalid;
   end invalidate;

   -------------------------------------------------------------------------

   procedure reset
     (Id : Types.cc_id_type)
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
