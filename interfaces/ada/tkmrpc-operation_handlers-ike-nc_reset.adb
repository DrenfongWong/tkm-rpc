with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.nc_reset.Convert;
with TKMRPC.Response.IKE.nc_reset.Convert;

package body TKMRPC.Operation_Handlers.IKE.nc_reset
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.nc_reset.Request_Type;
      Specific_Res   : Response.IKE.nc_reset.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.nc_reset.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.nc_reset
        (nc_id => Specific_Req.Data.nc_id,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.nc_reset.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.nc_reset;
