with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Dh_Reset.Convert;
with Tkmrpc.Response.Ike.Dh_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Dh_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Dh_Reset.Request_Type;
      Specific_Res : Response.Ike.Dh_Reset.Response_Type;
   begin
      Specific_Res := Response.Ike.Dh_Reset.Null_Response;

      Specific_Req := Request.Ike.Dh_Reset.Convert.From_Request (S => Req);

      if not (Specific_Req.Data.Dh_Id'Valid) then
         Res.Header.Result := Results.Invalid_Parameter;
         return;
      end if;

      Servers.Ike.Dh_Reset
        (Result => Specific_Res.Header.Result,
         Dh_Id  => Specific_Req.Data.Dh_Id);

      Res := Response.Ike.Dh_Reset.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Dh_Reset;
