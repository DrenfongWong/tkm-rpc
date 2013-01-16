with Tkmrpc.Servers.Ike;
with Tkmrpc.Response.Ike.Tkm_Version.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Tkm_Version is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      --# accept W, 3, "Ignore Unreferenced pragma";
      pragma Unreferenced (Req);
      --# end accept;

      Specific_Res : Response.Ike.Tkm_Version.Response_Type;
   begin
      Specific_Res := Response.Ike.Tkm_Version.Null_Response;

      Servers.Ike.Tkm_Version
        (Result  => Specific_Res.Header.Result,
         Version => Specific_Res.Data.Version);

      --# accept W, 13,
      --#        Response.IKE.tkm_version.Convert.To_Response,
      --#        "Validity is assured by preconditions";
      Res := Response.Ike.Tkm_Version.Convert.To_Response (S => Specific_Res);
      --# end accept;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Tkm_Version;
