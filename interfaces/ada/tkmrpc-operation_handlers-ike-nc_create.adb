with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.nc_create.Convert;
with TKMRPC.Response.IKE.nc_create.Convert;

package body TKMRPC.Operation_Handlers.IKE.nc_create
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.nc_create.Request_Type;
      Specific_Res   : Response.IKE.nc_create.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.nc_create.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.nc_create
        (nc_id => Specific_Req.Data.nc_id,
         nonce_length => Specific_Req.Data.nonce_length,
         nonce => Specific_Res.Data.nonce,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.nc_create.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.nc_create;
