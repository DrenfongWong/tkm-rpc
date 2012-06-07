with TKMRPC.Servers.IKE;
with TKMRPC.Response.IKE.tkm_version.Convert;

package body TKMRPC.Operation_Handlers.IKE.tkm_version
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (Req);

      Specific_Res   : Response.IKE.tkm_version.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Implementation := Servers.IKE.Get_Instance;
      Implementation.tkm_version
        (version => Specific_Res.Data.version,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.tkm_version.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.tkm_version;
