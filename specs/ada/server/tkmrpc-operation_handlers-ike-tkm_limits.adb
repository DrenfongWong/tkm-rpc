with Tkmrpc.Servers.Ike;
with Tkmrpc.Response.Ike.Tkm_Limits.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Tkm_Limits is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      pragma Unreferenced (Req);

      Specific_Res : Response.Ike.Tkm_Limits.Response_Type;
   begin
      Servers.Ike.Tkm_Limits
        (Result              => Specific_Res.Header.Result,
         Max_Active_Requests => Specific_Res.Data.Max_Active_Requests,
         Nc_Contexts         => Specific_Res.Data.Nc_Contexts,
         Dh_Contexts         => Specific_Res.Data.Dh_Contexts,
         Cc_Contexts         => Specific_Res.Data.Cc_Contexts,
         Ae_Contexts         => Specific_Res.Data.Ae_Contexts,
         Isa_Contexts        => Specific_Res.Data.Isa_Contexts,
         Esa_Contexts        => Specific_Res.Data.Esa_Contexts);

      Res := Response.Ike.Tkm_Limits.Convert.To_Response (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Tkm_Limits;
