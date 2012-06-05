with TKMRPC.Constants;
with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.nc_create.Convert;
with TKMRPC.Response.IKE.nc_create.Convert;

package body TKMRPC.Operation_Handlers.Nonce_Create
is
   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Create_Req : Request.IKE.nc_create.Request_Type;
      Create_Res : Response.IKE.nc_create.Response_Type;
      Impl       : Servers.IKE.IKE_Handle;
   begin
      Impl := Servers.IKE.Get_Instance;
      Create_Req := Request.IKE.nc_create.Convert.From_Request (S => Req);
      Impl.nc_create (nc_id        => Create_Req.Data.nc_id,
                      nonce_length => Create_Req.Data.nonce_length,
                      nonce        => Create_Res.Data.nonce,
                      Result       => Create_Res.Header.Result);
      Res := Response.IKE.nc_create.Convert.To_Response (S => Create_Res);

   exception
      when others =>
         Res                   := Constants.Invalid_Operation;
         Res.Header.Request_ID := Req.Header.Request_ID;
   end Handle;

end TKMRPC.Operation_Handlers.Nonce_Create;
