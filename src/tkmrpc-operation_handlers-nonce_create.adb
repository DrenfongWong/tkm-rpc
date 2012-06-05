with TKMRPC.Implementation;
with TKMRPC.Types;
with TKMRPC.Constants;
with TKMRPC.Results;
with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.nc_create.Convert;
with TKMRPC.Response.IKE.nc_create.Convert;

package body TKMRPC.Operation_Handlers.Nonce_Create
is
   -------------------------------------------------------------------------

   procedure Handle
     (H   :     Nonce_Create_Type;
      Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (H);

      Create_Req : Request.IKE.nc_create.Request_Type;
      Create_Res : Response.IKE.nc_create.Response_Type;
      Nonce      : Types.nonce_type;
      Impl       : Servers.IKE.IKE_Handle;
      Result     : Results.Result_Type;
   begin
      Impl := Implementation.Get_Impl;
      Create_Req := Request.IKE.nc_create.Convert.From_Request (S => Req);
      Impl.nc_create (nc_id        => Create_Req.Data.nc_id,
                      nonce_length => Create_Req.Data.nonce_length,
                      nonce        => Nonce,
                      Result       => Result);

      Create_Res.Header.Result := Result;
      Create_Res.Data.nonce    := Nonce;

      Res := Response.IKE.nc_create.Convert.To_Response (S => Create_Res);

   exception
      when others =>
         Res                   := Constants.Invalid_Operation;
         Res.Header.Request_ID := Req.Header.Request_ID;
   end Handle;

end TKMRPC.Operation_Handlers.Nonce_Create;
