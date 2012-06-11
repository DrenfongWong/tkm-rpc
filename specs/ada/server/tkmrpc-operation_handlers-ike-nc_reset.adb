with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Nc_Reset.Convert;
with Tkmrpc.Response.Ike.Nc_Reset.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Nc_Reset is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Nc_Reset.Request_Type;
      Specific_Res : Response.Ike.Nc_Reset.Response_Type;
   begin
      Specific_Req := Request.Ike.Nc_Reset.Convert.From_Request (S => Req);

      Servers.Ike.Nc_Reset
        (Result => Specific_Res.Header.Result,
         Nc_Id  => Specific_Req.Data.Nc_Id);

      Res := Response.Ike.Nc_Reset.Convert.To_Response (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Nc_Reset;
