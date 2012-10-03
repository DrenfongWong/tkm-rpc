with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Esa_Select.Convert;
with Tkmrpc.Response.Ike.Esa_Select.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Select is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Select.Request_Type;
      Specific_Res : Response.Ike.Esa_Select.Response_Type;
   begin
      Specific_Res := Response.Ike.Esa_Select.Null_Response;

      Specific_Req := Request.Ike.Esa_Select.Convert.From_Request (S => Req);

      Servers.Ike.Esa_Select
        (Result => Specific_Res.Header.Result,
         Esa_Id => Specific_Req.Data.Esa_Id);

      Res := Response.Ike.Esa_Select.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Select;
