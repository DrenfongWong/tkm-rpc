with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Cc_Check_Ca.Convert;
with Tkmrpc.Response.Ike.Cc_Check_Ca.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Cc_Check_Ca.Request_Type;
      Specific_Res : Response.Ike.Cc_Check_Ca.Response_Type;
   begin
      Specific_Req := Request.Ike.Cc_Check_Ca.Convert.From_Request (S => Req);

      Servers.Ike.Cc_Check_Ca
        (Result => Specific_Res.Header.Result,
         Cc_Id  => Specific_Req.Data.Cc_Id,
         Ca_Id  => Specific_Req.Data.Ca_Id);

      Res := Response.Ike.Cc_Check_Ca.Convert.To_Response (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca;
