with
  Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Dh_Create.Convert;
with Tkmrpc.Response.Ike.Dh_Create.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Dh_Create is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Dh_Create.Request_Type;
      Specific_Res : Response.Ike.Dh_Create.Response_Type;
   begin
      Specific_Res := Response.Ike.Dh_Create.Null_Response;

      Specific_Req := Request.Ike.Dh_Create.Convert.From_Request (S => Req);

      if Specific_Req.Data.Dh_Id'Valid and
         Specific_Req.Data.Dha_Id'Valid
      then
         Servers.Ike.Dh_Create
           (Result   => Specific_Res.Header.Result,
            Dh_Id    => Specific_Req.Data.Dh_Id,
            Dha_Id   => Specific_Req.Data.Dha_Id,
            Pubvalue => Specific_Res.Data.Pubvalue);

         Res :=
            Response.Ike.Dh_Create.Convert.To_Response (S => Specific_Res);

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Dh_Create;
