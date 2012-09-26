with Tkmrpc.Servers.Ike;
with Tkmrpc.Request.Ike.Esa_Create_First.Convert;
with Tkmrpc.Response.Ike.Esa_Create_First.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Esa_Create_First is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Esa_Create_First.Request_Type;
      Specific_Res : Response.Ike.Esa_Create_First.Response_Type;
   begin
      Specific_Req :=
         Request.Ike.Esa_Create_First.Convert.From_Request (S => Req);

      Servers.Ike.Esa_Create_First
        (Result      => Specific_Res.Header.Result,
         Esa_Id      => Specific_Req.Data.Esa_Id,
         Isa_Id      => Specific_Req.Data.Isa_Id,
         Sp_Id       => Specific_Req.Data.Sp_Id,
         Ea_Id       => Specific_Req.Data.Ea_Id,
         Esp_Spi_Loc => Specific_Req.Data.Esp_Spi_Loc,
         Esp_Spi_Rem => Specific_Req.Data.Esp_Spi_Rem);

      Res :=
         Response.Ike.Esa_Create_First.Convert.To_Response
           (S => Specific_Res);
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Esa_Create_First;
