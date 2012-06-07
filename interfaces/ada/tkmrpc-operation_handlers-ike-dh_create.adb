with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.dh_create.Convert;
with TKMRPC.Response.IKE.dh_create.Convert;

package body TKMRPC.Operation_Handlers.IKE.dh_create
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.dh_create.Request_Type;
      Specific_Res   : Response.IKE.dh_create.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.dh_create.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.dh_create
        (dh_id => Specific_Req.Data.dh_id,
         dha_id => Specific_Req.Data.dha_id,
         pubvalue => Specific_Res.Data.pubvalue,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.dh_create.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.dh_create;
