with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Dh_Create.Convert;
with Tkmrpc.Response.Ike.Dh_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Dh_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Dh_Create.Request_Type;
      Specific_Res : Response.Ike.Dh_Create.Response_Type;
   begin
      Specific_Req := Request.Ike.Dh_Create.Convert.From_Request (S => Req);

      Servers.Ike.Dh_Create
        (Result   => Specific_Res.Header.Result,
         Dh_Id    => Specific_Req.Data.Dh_Id,
         Dha_Id   => Specific_Req.Data.Dha_Id,
         Pubvalue => Specific_Res.Data.Pubvalue);

      Res := Response.Ike.Dh_Create.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Dh_Create;
