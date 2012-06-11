with TKMRPC.Operations.IKE;
with TKMRPC.Operation_Handlers.IKE.tkm_version;
with TKMRPC.Operation_Handlers.IKE.tkm_limits;
with TKMRPC.Operation_Handlers.IKE.nc_reset;
with TKMRPC.Operation_Handlers.IKE.nc_create;
with TKMRPC.Operation_Handlers.IKE.dh_reset;
with TKMRPC.Operation_Handlers.IKE.dh_create;
with TKMRPC.Operation_Handlers.IKE.dh_generate_key;
with TKMRPC.Operation_Handlers.IKE.cc_reset;
with TKMRPC.Operation_Handlers.IKE.cc_set_user_certificate;
with TKMRPC.Operation_Handlers.IKE.cc_add_certificate;
with TKMRPC.Operation_Handlers.IKE.cc_check_ca;
with TKMRPC.Operation_Handlers.IKE.ae_reset;
with TKMRPC.Operation_Handlers.IKE.isa_reset;
with TKMRPC.Operation_Handlers.IKE.isa_create;
with TKMRPC.Operation_Handlers.IKE.isa_sign;
with TKMRPC.Operation_Handlers.IKE.isa_auth;
with TKMRPC.Operation_Handlers.IKE.isa_create_child;
with TKMRPC.Operation_Handlers.IKE.isa_skip_create_first;
with TKMRPC.Operation_Handlers.IKE.esa_reset;
with TKMRPC.Operation_Handlers.IKE.esa_create;
with TKMRPC.Operation_Handlers.IKE.esa_create_no_pfs;
with TKMRPC.Operation_Handlers.IKE.esa_create_first;
with TKMRPC.Operation_Handlers.IKE.esa_select;

package body TKMRPC.Dispatchers.IKE
is

   -------------------------------------------------------------------------

   procedure Dispatch
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
   begin
      case Req.Header.Operation is
         when Operations.IKE.tkm_version =>
            Operation_Handlers.IKE.tkm_version.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.tkm_limits =>
            Operation_Handlers.IKE.tkm_limits.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.nc_reset =>
            Operation_Handlers.IKE.nc_reset.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.nc_create =>
            Operation_Handlers.IKE.nc_create.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.dh_reset =>
            Operation_Handlers.IKE.dh_reset.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.dh_create =>
            Operation_Handlers.IKE.dh_create.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.dh_generate_key =>
            Operation_Handlers.IKE.dh_generate_key.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.cc_reset =>
            Operation_Handlers.IKE.cc_reset.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.cc_set_user_certificate =>
            Operation_Handlers.IKE.cc_set_user_certificate.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.cc_add_certificate =>
            Operation_Handlers.IKE.cc_add_certificate.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.cc_check_ca =>
            Operation_Handlers.IKE.cc_check_ca.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.ae_reset =>
            Operation_Handlers.IKE.ae_reset.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.isa_reset =>
            Operation_Handlers.IKE.isa_reset.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.isa_create =>
            Operation_Handlers.IKE.isa_create.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.isa_sign =>
            Operation_Handlers.IKE.isa_sign.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.isa_auth =>
            Operation_Handlers.IKE.isa_auth.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.isa_create_child =>
            Operation_Handlers.IKE.isa_create_child.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.isa_skip_create_first =>
            Operation_Handlers.IKE.isa_skip_create_first.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.esa_reset =>
            Operation_Handlers.IKE.esa_reset.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.esa_create =>
            Operation_Handlers.IKE.esa_create.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.esa_create_no_pfs =>
            Operation_Handlers.IKE.esa_create_no_pfs.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.esa_create_first =>
            Operation_Handlers.IKE.esa_create_first.Handle
              (Req => Req,
               Res => Res);
         when Operations.IKE.esa_select =>
            Operation_Handlers.IKE.esa_select.Handle
              (Req => Req,
               Res => Res);
         when others =>
            Res := Response.Null_Data;
      end case;

      Res.Header.Request_ID := Req.Header.Request_ID;
   end Dispatch;

end TKMRPC.Dispatchers.IKE;
