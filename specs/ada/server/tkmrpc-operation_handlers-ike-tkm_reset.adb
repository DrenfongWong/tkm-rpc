with Tkmrpc.Servers.Ike;
with Tkmrpc.Response.Ike.Tkm_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Tkm_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      pragma Unreferenced (Req);

      Specific_Res : Response.Ike.Tkm_Reset.Response_Type;
   begin
      Servers.Ike.Tkm_Reset (Result => Specific_Res.Header.Result);

      Res := Response.Ike.Tkm_Reset.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Tkm_Reset;
