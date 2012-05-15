with TKMRPC.Implementation;
with TKMRPC.Nonces;
with TKMRPC.Constants;
with TKMRPC.Interfaces.IKE.Server;
with TKMRPC.Request.Nonce_Create.Convert;
with TKMRPC.Response.Nonce_Create.Convert;

package body TKMRPC.Operation_Handlers.Nonce_Create
is
   -------------------------------------------------------------------------

   procedure Handle
     (H   :     Nonce_Create_Type;
      Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      pragma Unreferenced (H);

      Create_Req : Request.Nonce_Create.Request_Type;
      Create_Res : Response.Nonce_Create.Response_Type;
      Nonce      : Nonces.Nonce_Type;
      Impl       : Interfaces.IKE.Server.IKE_Access;
   begin
      Impl := Implementation.Get_Impl;
      Create_Req := Request.Nonce_Create.Convert.From_Request (S => Req);
      Nonce := Impl.Nc_Create (Nonce_Id     => Create_Req.Data.Nonce_ID,
                               Nonce_Length => Create_Req.Data.Nonce_Length);

      Create_Res.Data.Nonce := Nonce.Value;
      Res := Response.Nonce_Create.Convert.To_Response (S => Create_Res);

   exception
      when others =>
         Res                   := Constants.Invalid_Operation;
         Res.Header.Request_ID := Req.Header.Request_ID;
   end Handle;

end TKMRPC.Operation_Handlers.Nonce_Create;
