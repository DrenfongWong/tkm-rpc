with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Esa_Select.Convert;
with Tkmrpc.Response.Ike.Esa_Select.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Select is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Select.Request_Type;
      Specific_Res : Response.Ike.Esa_Select.Response_Type;
   begin
      Specific_Res := Response.Ike.Esa_Select.Null_Response;

      --# accept W, 13,
      --#        Request.IKE.esa_select.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req := Request.Ike.Esa_Select.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Esa_Id'Valid then
         Servers.Ike.Esa_Select
           (Result => Specific_Res.Header.Result,
            Esa_Id => Specific_Req.Data.Esa_Id);

         --# accept W, 13,
         --#        Response.IKE.esa_select.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ike.Esa_Select.Convert.To_Response (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Select;
