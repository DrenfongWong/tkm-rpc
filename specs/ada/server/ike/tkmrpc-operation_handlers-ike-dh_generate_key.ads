with Tkmrpc.Request;
with Tkmrpc.Response;

--# inherit
--#    Tkmrpc.Request,
--#    Tkmrpc.Response,
--#    Tkmrpc.Results,
--#    Tkmrpc.Servers.IKE,
--#    Tkmrpc.Request.IKE.dh_generate_key.Convert,
--#    Tkmrpc.Response.IKE.dh_generate_key.Convert;

package Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key is

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type);
   --  Handler for the dh_generate_key operation.
   --# Derives Res from Req;

end Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key;
