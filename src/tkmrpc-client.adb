with TKMRPC.Operations;
with TKMRPC.Transport.Client;
with TKMRPC.Results;
with TKMRPC.Request.Nonce_Create.Convert;
with TKMRPC.Response.Nonce_Create.Convert;

package body TKMRPC.Client
is
   -------------------------------------------------------------------------

   procedure Init (Object : in out IKE_Type)
   is
      pragma Unreferenced (Object);
   begin
      Transport.Client.Connect (Address => Communication_Socket);
   end Init;

   -------------------------------------------------------------------------

   function Nc_Create
     (Object       : IKE_Type;
      Nonce_Id     : Nonces.Nonce_Id_Type;
      Nonce_Length : Nonces.Nonce_Length_Type)
      return Nonces.Nonce_Type
   is
      pragma Unreferenced (Object);

      use type TKMRPC.Results.Result_Type;

      Req : Request.Nonce_Create.Request_Type;
   begin
      Req.Header.Operation  := Operations.Nonce_Create;
      Req.Data.Nonce_ID     := Nonce_Id;
      Req.Data.Nonce_Length := Nonce_Length;

      Transport.Client.Send
        (Data => Request.Nonce_Create.Convert.To_Request (S => Req));

      declare
         Data : Response.Data_Type;
         Res  : Response.Nonce_Create.Response_Type;
      begin
         Transport.Client.Receive (Data => Data);
         Res := Response.Nonce_Create.Convert.From_Response (S => Data);

         if Res.Header.Result /= Results.OK then
            raise RPC_Error with "RPC call failed (error code"
              & Res.Header.Result'Img & ")";
         end if;

         return N : Nonces.Nonce_Type do
            N.Length := Nonce_Length;
            N.Value  := Res.Data.Nonce;
         end return;
      end;
   end Nc_Create;

end TKMRPC.Client;
