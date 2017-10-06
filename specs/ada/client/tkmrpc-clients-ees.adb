with Tkmrpc.Transport.Client;
with Tkmrpc.Request.Ees.Esa_Acquire.Convert;
with Tkmrpc.Request.Ees.Esa_Expire.Convert;
with Tkmrpc.Response.Ees.Esa_Acquire.Convert;
with Tkmrpc.Response.Ees.Esa_Expire.Convert;

package body Tkmrpc.Clients.Ees is

   -------------------------------------------------------------------------

   procedure Esa_Acquire
     (Result : out Results.Result_Type;
      Sp_Id  : Types.Sp_Id_Type)
   is
      Req  : Request.Ees.Esa_Acquire.Request_Type;
      Res  : Response.Ees.Esa_Acquire.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Sp_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req            := Request.Ees.Esa_Acquire.Null_Request;
      Req.Data.Sp_Id := Sp_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ees.Esa_Acquire.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ees.Esa_Acquire.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Acquire;

   -------------------------------------------------------------------------

   procedure Esa_Expire
     (Result   : out Results.Result_Type;
      Sp_Id    : Types.Sp_Id_Type;
      Spi_Rem  : Types.Esp_Spi_Type;
      Protocol : Types.Protocol_Type;
      Hard     : Types.Expiry_Flag_Type)
   is
      Req  : Request.Ees.Esa_Expire.Request_Type;
      Res  : Response.Ees.Esa_Expire.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Sp_Id'Valid and
              Spi_Rem'Valid and
              Protocol'Valid and
              Hard'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req               := Request.Ees.Esa_Expire.Null_Request;
      Req.Data.Sp_Id    := Sp_Id;
      Req.Data.Spi_Rem  := Spi_Rem;
      Req.Data.Protocol := Protocol;
      Req.Data.Hard     := Hard;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ees.Esa_Expire.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ees.Esa_Expire.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Expire;

   -------------------------------------------------------------------------

   procedure Init
     (Result  : out Results.Result_Type;
      Address : Interfaces.C.Strings.chars_ptr) is separate;

end Tkmrpc.Clients.Ees;
