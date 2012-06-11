with TKMRPC.Servers.CFG;
with TKMRPC.Response.CFG.tkm_limits.Convert;

package body TKMRPC.Operation_Handlers.CFG.tkm_limits
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (Req);

      Specific_Res   : Response.CFG.tkm_limits.Response_Type;
   begin
      Servers.CFG.tkm_limits
        (Result => Specific_Res.Header.Result,
         max_active_requests => Specific_Res.Data.max_active_requests,
         authag_contexts => Specific_Res.Data.authag_contexts,
         cag_contexts => Specific_Res.Data.cag_contexts,
         li_contexts => Specific_Res.Data.li_contexts,
         ri_contexts => Specific_Res.Data.ri_contexts,
         iag_contexts => Specific_Res.Data.iag_contexts,
         eag_contexts => Specific_Res.Data.eag_contexts,
         dhag_contexts => Specific_Res.Data.dhag_contexts,
         sp_contexts => Specific_Res.Data.sp_contexts,
         authp_contexts => Specific_Res.Data.authp_contexts,
         dhp_contexts => Specific_Res.Data.dhp_contexts,
         autha_contexts => Specific_Res.Data.autha_contexts,
         ca_contexts => Specific_Res.Data.ca_contexts,
         lc_contexts => Specific_Res.Data.lc_contexts,
         ia_contexts => Specific_Res.Data.ia_contexts,
         ea_contexts => Specific_Res.Data.ea_contexts,
         dha_contexts => Specific_Res.Data.dha_contexts);

      Res := Response.CFG.tkm_limits.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.CFG.tkm_limits;
