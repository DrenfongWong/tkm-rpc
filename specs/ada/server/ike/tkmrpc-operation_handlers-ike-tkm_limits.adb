with Tkmrpc.Servers.Ike;
with Tkmrpc.Response.Ike.Tkm_Limits.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Tkm_Limits is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      --# accept W, 3, "Ignore Unreferenced pragma";
      pragma Unreferenced (Req);
      --# end accept;

      Specific_Res : Response.Ike.Tkm_Limits.Response_Type;
   begin
      Specific_Res := Response.Ike.Tkm_Limits.Null_Response;

      Servers.Ike.Tkm_Limits
        (Result              => Specific_Res.Header.Result,
         Max_Active_Requests => Specific_Res.Data.Max_Active_Requests,
         Nc_Contexts         => Specific_Res.Data.Nc_Contexts,
         Dh_Contexts         => Specific_Res.Data.Dh_Contexts,
         Cc_Contexts         => Specific_Res.Data.Cc_Contexts,
         Ae_Contexts         => Specific_Res.Data.Ae_Contexts,
         Isa_Contexts        => Specific_Res.Data.Isa_Contexts,
         Esa_Contexts        => Specific_Res.Data.Esa_Contexts);

      --# accept W, 13,
      --#        Response.IKE.tkm_limits.Convert.To_Response,
      --#        "Validity is assured by preconditions";
      Res := Response.Ike.Tkm_Limits.Convert.To_Response (S => Specific_Res);
      --# end accept;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Tkm_Limits;
