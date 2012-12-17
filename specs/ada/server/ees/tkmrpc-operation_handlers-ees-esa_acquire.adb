with Tkmrpc.Servers.Ees;
with Tkmrpc.Results;
with Tkmrpc.Request.Ees.Esa_Acquire.Convert;
with Tkmrpc.Response.Ees.Esa_Acquire.Convert;

package body Tkmrpc.Operation_Handlers.Ees.Esa_Acquire is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ees.Esa_Acquire.Request_Type;
      Specific_Res : Response.Ees.Esa_Acquire.Response_Type;
   begin
      Specific_Res := Response.Ees.Esa_Acquire.Null_Response;

      Specific_Req := Request.Ees.Esa_Acquire.Convert.From_Request (S => Req);

      if not (Specific_Req.Data.Sp_Id'Valid) then
         Res.Header.Result := Results.Invalid_Parameter;
         return;
      end if;

      Servers.Ees.Esa_Acquire
        (Result => Specific_Res.Header.Result,
         Sp_Id  => Specific_Req.Data.Sp_Id);

      Res := Response.Ees.Esa_Acquire.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ees.Esa_Acquire;
