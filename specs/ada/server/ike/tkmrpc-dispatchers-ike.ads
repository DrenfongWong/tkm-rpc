with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Operations.IKE,
--#    Tkmrpc.Operation_Handlers.IKE.tkm_version,
--#    Tkmrpc.Operation_Handlers.IKE.tkm_limits,
--#    Tkmrpc.Operation_Handlers.IKE.tkm_reset,
--#    Tkmrpc.Operation_Handlers.IKE.nc_reset,
--#    Tkmrpc.Operation_Handlers.IKE.nc_create,
--#    Tkmrpc.Operation_Handlers.IKE.dh_reset,
--#    Tkmrpc.Operation_Handlers.IKE.dh_create,
--#    Tkmrpc.Operation_Handlers.IKE.dh_generate_key,
--#    Tkmrpc.Operation_Handlers.IKE.cc_reset,
--#    Tkmrpc.Operation_Handlers.IKE.cc_set_user_certificate,
--#    Tkmrpc.Operation_Handlers.IKE.cc_add_certificate,
--#    Tkmrpc.Operation_Handlers.IKE.cc_check_ca,
--#    Tkmrpc.Operation_Handlers.IKE.ae_reset,
--#    Tkmrpc.Operation_Handlers.IKE.isa_reset,
--#    Tkmrpc.Operation_Handlers.IKE.isa_create,
--#    Tkmrpc.Operation_Handlers.IKE.isa_sign,
--#    Tkmrpc.Operation_Handlers.IKE.isa_auth,
--#    Tkmrpc.Operation_Handlers.IKE.isa_create_child,
--#    Tkmrpc.Operation_Handlers.IKE.isa_skip_create_first,
--#    Tkmrpc.Operation_Handlers.IKE.esa_reset,
--#    Tkmrpc.Operation_Handlers.IKE.esa_create,
--#    Tkmrpc.Operation_Handlers.IKE.esa_create_no_pfs,
--#    Tkmrpc.Operation_Handlers.IKE.esa_create_first,
--#    Tkmrpc.Operation_Handlers.IKE.esa_select;

package Tkmrpc.Dispatchers.Ike is

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type);
   --  Dispatch IKE request to concrete operation handler.
   --# derives Res from Req;

end Tkmrpc.Dispatchers.Ike;
