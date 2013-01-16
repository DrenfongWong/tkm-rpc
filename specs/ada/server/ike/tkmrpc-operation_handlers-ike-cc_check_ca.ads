with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.cc_check_ca.Convert,
--#    Tkmrpc.Response.IKE.cc_check_ca.Convert;

package Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the cc_check_ca operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca;
