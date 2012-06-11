with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Esa_Reset.Convert;
with Tkmrpc.Response.Ike.Esa_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Reset.Request_Type;
      Specific_Res : Response.Ike.Esa_Reset.Response_Type;
   begin
      Specific_Req := Request.Ike.Esa_Reset.Convert.From_Request (S => Req);

      Servers.Ike.Esa_Reset
        (Result => Specific_Res.Header.Result,
         Esa_Id => Specific_Req.Data.Esa_Id);

      Res := Response.Ike.Esa_Reset.Convert.To_Response (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Reset;
