with Tkmrpc.Servers.Ike;
with Tkmrpc.Response.Ike.Tkm_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Tkm_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      --# accept W, 3, "Ignore Unreferenced pragma";
      pragma Unreferenced (Req);
      --# end accept;

      Specific_Res : Response.Ike.Tkm_Reset.Response_Type;
   begin
      Specific_Res := Response.Ike.Tkm_Reset.Null_Response;

      Servers.Ike.Tkm_Reset (Result => Specific_Res.Header.Result);

      --# accept W, 13,
      --#        Response.IKE.tkm_reset.Convert.To_Response,
      --#        "Validity is assured by preconditions";
      Res := Response.Ike.Tkm_Reset.Convert.To_Response (S => Specific_Res);
      --# end accept;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Tkm_Reset;
