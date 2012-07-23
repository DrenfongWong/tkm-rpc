with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Dh_Get_Shared_Secret.Convert;
with Tkmrpc.Response.Ike.Dh_Get_Shared_Secret.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Dh_Get_Shared_Secret is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Dh_Get_Shared_Secret.Request_Type;
      Specific_Res : Response.Ike.Dh_Get_Shared_Secret.Response_Type;
   begin
      Specific_Req :=
         Request.Ike.Dh_Get_Shared_Secret.Convert.From_Request (S => Req);

      Servers.Ike.Dh_Get_Shared_Secret
        (Result       => Specific_Res.Header.Result,
         Dh_Id        => Specific_Req.Data.Dh_Id,
         Sharedsecret => Specific_Res.Data.Sharedsecret);

      Res :=
         Response.Ike.Dh_Get_Shared_Secret.Convert.To_Response
           (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Dh_Get_Shared_Secret;
