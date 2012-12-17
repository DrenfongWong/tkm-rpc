with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Dh_Generate_Key.Convert;
with Tkmrpc.Response.Ike.Dh_Generate_Key.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Dh_Generate_Key.Request_Type;
      Specific_Res : Response.Ike.Dh_Generate_Key.Response_Type;
   begin
      Specific_Res := Response.Ike.Dh_Generate_Key.Null_Response;

      Specific_Req :=
         Request.Ike.Dh_Generate_Key.Convert.From_Request (S => Req);

      if not (Specific_Req.Data.Dh_Id'Valid and
              Specific_Req.Data.Pubvalue.Size'Valid)
      then
         Res.Header.Result := Results.Invalid_Parameter;
         return;
      end if;

      Servers.Ike.Dh_Generate_Key
        (Result   => Specific_Res.Header.Result,
         Dh_Id    => Specific_Req.Data.Dh_Id,
         Pubvalue => Specific_Req.Data.Pubvalue);

      Res :=
         Response.Ike.Dh_Generate_Key.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key;
