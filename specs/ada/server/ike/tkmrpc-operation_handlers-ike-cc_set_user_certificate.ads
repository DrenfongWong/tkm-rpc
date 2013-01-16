with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.cc_set_user_certificate.Convert,
--#    Tkmrpc.Response.IKE.cc_set_user_certificate.Convert;

package Tkmrpc.Operation_Handlers.Ike.Cc_Set_User_Certificate is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the cc_set_user_certificate operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Cc_Set_User_Certificate;
