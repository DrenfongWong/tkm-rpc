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

      --# accept W, 13,
      --#        Request.EES.esa_acquire.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ees.Esa_Acquire.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Sp_Id'Valid then
         Servers.Ees.Esa_Acquire
           (Result => Specific_Res.Header.Result,
            Sp_Id  => Specific_Req.Data.Sp_Id);

         --# accept W, 13,
         --#        Response.EES.esa_acquire.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ees.Esa_Acquire.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ees.Esa_Acquire;
