with TKMRPC.Servers.IKE;
with TKMRPC.Request.IKE.isa_create_child.Convert;
with TKMRPC.Response.IKE.isa_create_child.Convert;

package body TKMRPC.Operation_Handlers.IKE.isa_create_child
is

   -------------------------------------------------------------------------

   procedure Handle
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
      Specific_Req   : Request.IKE.isa_create_child.Request_Type;
      Specific_Res   : Response.IKE.isa_create_child.Response_Type;
      Implementation : Servers.IKE.IKE_Handle;
   begin
      Specific_Req := Request.IKE.isa_create_child.Convert.From_Request
        (S => Req);

      Implementation := Servers.IKE.Get_Instance;
      Implementation.isa_create_child
        (isa_id => Specific_Req.Data.isa_id,
         parent_isa_id => Specific_Req.Data.parent_isa_id,
         ia_id => Specific_Req.Data.ia_id,
         dh_id => Specific_Req.Data.dh_id,
         nc_loc_id => Specific_Req.Data.nc_loc_id,
         nonce_rem => Specific_Req.Data.nonce_rem,
         initiator => Specific_Req.Data.initiator,
         spi_loc => Specific_Req.Data.spi_loc,
         spi_rem => Specific_Req.Data.spi_rem,
         sk_ai => Specific_Res.Data.sk_ai,
         sk_ar => Specific_Res.Data.sk_ar,
         sk_ei => Specific_Res.Data.sk_ei,
         sk_er => Specific_Res.Data.sk_er,
         Result => Specific_Res.Header.Result);

      Res := Response.IKE.isa_create_child.Convert.To_Response
        (S => Specific_Res);

   exception
      when others =>
         Res := Response.Null_Data;
   end Handle;

end TKMRPC.Operation_Handlers.IKE.isa_create_child;
