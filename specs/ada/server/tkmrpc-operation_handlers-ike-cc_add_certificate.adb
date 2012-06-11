with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Cc_Add_Certificate.Convert;
with Tkmrpc.Response.Ike.Cc_Add_Certificate.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Cc_Add_Certificate is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Cc_Add_Certificate.Request_Type;
      Specific_Res : Response.Ike.Cc_Add_Certificate.Response_Type;
   begin
      Specific_Req :=
         Request.Ike.Cc_Add_Certificate.Convert.From_Request (S => Req);

      Servers.Ike.Cc_Add_Certificate
        (Result      => Specific_Res.Header.Result,
         Cc_Id       => Specific_Req.Data.Cc_Id,
         Autha_Id    => Specific_Req.Data.Autha_Id,
         Certificate => Specific_Req.Data.Certificate);

      Res :=
         Response.Ike.Cc_Add_Certificate.Convert.To_Response
           (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Cc_Add_Certificate;
