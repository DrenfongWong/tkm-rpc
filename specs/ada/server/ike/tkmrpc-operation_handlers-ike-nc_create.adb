with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Nc_Create.Convert;
with Tkmrpc.Response.Ike.Nc_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Nc_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Nc_Create.Request_Type;
      Specific_Res : Response.Ike.Nc_Create.Response_Type;
   begin
      Specific_Req := Request.Ike.Nc_Create.Convert.From_Request (S => Req);

      Servers.Ike.Nc_Create
        (Result       => Specific_Res.Header.Result,
         Nc_Id        => Specific_Req.Data.Nc_Id,
         Nonce_Length => Specific_Req.Data.Nonce_Length,
         Nonce        => Specific_Res.Data.Nonce);

      Res := Response.Ike.Nc_Create.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Nc_Create;
