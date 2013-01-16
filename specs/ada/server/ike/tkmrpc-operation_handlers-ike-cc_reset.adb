with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Cc_Reset.Convert;
with Tkmrpc.Response.Ike.Cc_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Cc_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Cc_Reset.Request_Type;
      Specific_Res : Response.Ike.Cc_Reset.Response_Type;
   begin
      Specific_Res := Response.Ike.Cc_Reset.Null_Response;

      Specific_Req := Request.Ike.Cc_Reset.Convert.From_Request (S => Req);

      if Specific_Req.Data.Cc_Id'Valid then
         Servers.Ike.Cc_Reset
           (Result => Specific_Res.Header.Result,
            Cc_Id  => Specific_Req.Data.Cc_Id);

         Res := Response.Ike.Cc_Reset.Convert.To_Response (S => Specific_Res);

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Cc_Reset;
