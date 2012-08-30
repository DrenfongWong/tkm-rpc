with Tkmrpc.Servers.Cfg;
with Tkmrpc.Response.Cfg.Tkm_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Cfg.Tkm_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      pragma Unreferenced (Req);

      Specific_Res : Response.Cfg.Tkm_Reset.Response_Type;
   begin
      Servers.Cfg.Tkm_Reset (Result => Specific_Res.Header.Result);

      Res := Response.Cfg.Tkm_Reset.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Cfg.Tkm_Reset;
