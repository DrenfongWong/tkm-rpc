with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.esa_select.Convert;
with TKMRPC.Response.IKE.esa_select.Convert;

package body TKMRPC.Operation_Handlers.IKE.esa_select
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.esa_select.Request_Type;
      Specific_Res   : Response.IKE.esa_select.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.esa_select.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.esa_select
        (esa_id => Specific_Req.Data.esa_id,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.esa_select.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.esa_select;
