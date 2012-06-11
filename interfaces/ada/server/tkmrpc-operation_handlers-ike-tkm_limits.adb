with TKMRPC.Servers.IKE;
with TKMRPC.Response.IKE.tkm_limits.Convert;

package body TKMRPC.Operation_Handlers.IKE.tkm_limits
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (Req);

      Specific_Res   : Response.IKE.tkm_limits.Response_Type;
   begin
      Servers.IKE.tkm_limits
        (Result => Specific_Res.Header.Result,
         max_active_requests => Specific_Res.Data.max_active_requests,
         nc_contexts => Specific_Res.Data.nc_contexts,
         dh_contexts => Specific_Res.Data.dh_contexts,
         cc_contexts => Specific_Res.Data.cc_contexts,
         ae_contexts => Specific_Res.Data.ae_contexts,
         isa_contexts => Specific_Res.Data.isa_contexts,
         esa_contexts => Specific_Res.Data.esa_contexts);

      Res := Response.IKE.tkm_limits.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.tkm_limits;
