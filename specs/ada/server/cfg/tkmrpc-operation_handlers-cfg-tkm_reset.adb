with Tkmrpc.Servers.Cfg;
with Tkmrpc.Response.Cfg.Tkm_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Cfg.Tkm_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      --# accept W, 3, "Ignore Unreferenced pragma";
      pragma Unreferenced (Req);
      --# end accept;

      Specific_Res : Response.Cfg.Tkm_Reset.Response_Type;
   begin
      Specific_Res := Response.Cfg.Tkm_Reset.Null_Response;

      Servers.Cfg.Tkm_Reset (Result => Specific_Res.Header.Result);

      --# accept W, 13,
      --#        Response.CFG.tkm_reset.Convert.To_Response,
      --#        "Validity is assured by preconditions";
      Res := Response.Cfg.Tkm_Reset.Convert.To_Response (S => Specific_Res);
      --# end accept;
   end Handle;

end Tkmrpc.Operation_Handlers.Cfg.Tkm_Reset;
