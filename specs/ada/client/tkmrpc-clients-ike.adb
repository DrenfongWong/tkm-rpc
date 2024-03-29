with Tkmrpc.Transport.Client;
with Tkmrpc.Request.Ike.Tkm_Version.Convert;
with Tkmrpc.Request.Ike.Tkm_Limits.Convert;
with Tkmrpc.Request.Ike.Tkm_Reset.Convert;
with Tkmrpc.Request.Ike.Nc_Reset.Convert;
with Tkmrpc.Request.Ike.Nc_Create.Convert;
with Tkmrpc.Request.Ike.Dh_Reset.Convert;
with Tkmrpc.Request.Ike.Dh_Create.Convert;
with Tkmrpc.Request.Ike.Dh_Generate_Key.Convert;
with Tkmrpc.Request.Ike.Cc_Reset.Convert;
with Tkmrpc.Request.Ike.Cc_Set_User_Certificate.Convert;
with Tkmrpc.Request.Ike.Cc_Add_Certificate.Convert;
with Tkmrpc.Request.Ike.Cc_Check_Ca.Convert;
with Tkmrpc.Request.Ike.Ae_Reset.Convert;
with Tkmrpc.Request.Ike.Isa_Reset.Convert;
with Tkmrpc.Request.Ike.Isa_Create.Convert;
with Tkmrpc.Request.Ike.Isa_Sign.Convert;
with Tkmrpc.Request.Ike.Isa_Auth.Convert;
with Tkmrpc.Request.Ike.Isa_Create_Child.Convert;
with Tkmrpc.Request.Ike.Isa_Skip_Create_First.Convert;
with Tkmrpc.Request.Ike.Esa_Reset.Convert;
with Tkmrpc.Request.Ike.Esa_Create.Convert;
with Tkmrpc.Request.Ike.Esa_Create_No_Pfs.Convert;
with Tkmrpc.Request.Ike.Esa_Create_First.Convert;
with Tkmrpc.Request.Ike.Esa_Select.Convert;
with Tkmrpc.Response.Ike.Tkm_Version.Convert;
with Tkmrpc.Response.Ike.Tkm_Limits.Convert;
with Tkmrpc.Response.Ike.Tkm_Reset.Convert;
with Tkmrpc.Response.Ike.Nc_Reset.Convert;
with Tkmrpc.Response.Ike.Nc_Create.Convert;
with Tkmrpc.Response.Ike.Dh_Reset.Convert;
with Tkmrpc.Response.Ike.Dh_Create.Convert;
with Tkmrpc.Response.Ike.Dh_Generate_Key.Convert;
with Tkmrpc.Response.Ike.Cc_Reset.Convert;
with Tkmrpc.Response.Ike.Cc_Set_User_Certificate.Convert;
with Tkmrpc.Response.Ike.Cc_Add_Certificate.Convert;
with Tkmrpc.Response.Ike.Cc_Check_Ca.Convert;
with Tkmrpc.Response.Ike.Ae_Reset.Convert;
with Tkmrpc.Response.Ike.Isa_Reset.Convert;
with Tkmrpc.Response.Ike.Isa_Create.Convert;
with Tkmrpc.Response.Ike.Isa_Sign.Convert;
with Tkmrpc.Response.Ike.Isa_Auth.Convert;
with Tkmrpc.Response.Ike.Isa_Create_Child.Convert;
with Tkmrpc.Response.Ike.Isa_Skip_Create_First.Convert;
with Tkmrpc.Response.Ike.Esa_Reset.Convert;
with Tkmrpc.Response.Ike.Esa_Create.Convert;
with Tkmrpc.Response.Ike.Esa_Create_No_Pfs.Convert;
with Tkmrpc.Response.Ike.Esa_Create_First.Convert;
with Tkmrpc.Response.Ike.Esa_Select.Convert;

package body Tkmrpc.Clients.Ike is

   -------------------------------------------------------------------------

   procedure Ae_Reset
     (Result : out Results.Result_Type;
      Ae_Id  : Types.Ae_Id_Type)
   is
      Req  : Request.Ike.Ae_Reset.Request_Type;
      Res  : Response.Ike.Ae_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Ae_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req            := Request.Ike.Ae_Reset.Null_Request;
      Req.Data.Ae_Id := Ae_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Ae_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Ae_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Ae_Reset;

   -------------------------------------------------------------------------

   procedure Cc_Add_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type)
   is
      Req  : Request.Ike.Cc_Add_Certificate.Request_Type;
      Res  : Response.Ike.Cc_Add_Certificate.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Cc_Id'Valid and Autha_Id'Valid and Certificate.Size'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                  := Request.Ike.Cc_Add_Certificate.Null_Request;
      Req.Data.Cc_Id       := Cc_Id;
      Req.Data.Autha_Id    := Autha_Id;
      Req.Data.Certificate := Certificate;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Cc_Add_Certificate.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res :=
         Response.Ike.Cc_Add_Certificate.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Cc_Add_Certificate;

   -------------------------------------------------------------------------

   procedure Cc_Check_Ca
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type;
      Ca_Id  : Types.Ca_Id_Type)
   is
      Req  : Request.Ike.Cc_Check_Ca.Request_Type;
      Res  : Response.Ike.Cc_Check_Ca.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Cc_Id'Valid and Ca_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req            := Request.Ike.Cc_Check_Ca.Null_Request;
      Req.Data.Cc_Id := Cc_Id;
      Req.Data.Ca_Id := Ca_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Cc_Check_Ca.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Cc_Check_Ca.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Cc_Check_Ca;

   -------------------------------------------------------------------------

   procedure Cc_Reset
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type)
   is
      Req  : Request.Ike.Cc_Reset.Request_Type;
      Res  : Response.Ike.Cc_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Cc_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req            := Request.Ike.Cc_Reset.Null_Request;
      Req.Data.Cc_Id := Cc_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Cc_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Cc_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Cc_Reset;

   -------------------------------------------------------------------------

   procedure Cc_Set_User_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Ri_Id       : Types.Ri_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type)
   is
      Req  : Request.Ike.Cc_Set_User_Certificate.Request_Type;
      Res  : Response.Ike.Cc_Set_User_Certificate.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Cc_Id'Valid and
              Ri_Id'Valid and
              Autha_Id'Valid and
              Certificate.Size'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                  :=
        Request.Ike.Cc_Set_User_Certificate.Null_Request;
      Req.Data.Cc_Id       := Cc_Id;
      Req.Data.Ri_Id       := Ri_Id;
      Req.Data.Autha_Id    := Autha_Id;
      Req.Data.Certificate := Certificate;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Cc_Set_User_Certificate.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res :=
         Response.Ike.Cc_Set_User_Certificate.Convert.From_Response
           (S => Data);

      Result := Res.Header.Result;
   end Cc_Set_User_Certificate;

   -------------------------------------------------------------------------

   procedure Dh_Create
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Pubvalue : out Types.Dh_Pubvalue_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Dh_Create.Request_Type;
      Res  : Response.Ike.Dh_Create.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Dh_Id'Valid and Dha_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req             := Request.Ike.Dh_Create.Null_Request;
      Req.Data.Dh_Id  := Dh_Id;
      Req.Data.Dha_Id := Dha_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Dh_Create.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Dh_Create.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Pubvalue := Res.Data.Pubvalue;
      end if;
   end Dh_Create;

   -------------------------------------------------------------------------

   procedure Dh_Generate_Key
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Pubvalue : Types.Dh_Pubvalue_Type)
   is
      Req  : Request.Ike.Dh_Generate_Key.Request_Type;
      Res  : Response.Ike.Dh_Generate_Key.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Dh_Id'Valid and Pubvalue.Size'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req               := Request.Ike.Dh_Generate_Key.Null_Request;
      Req.Data.Dh_Id    := Dh_Id;
      Req.Data.Pubvalue := Pubvalue;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Dh_Generate_Key.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Dh_Generate_Key.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Dh_Generate_Key;

   -------------------------------------------------------------------------

   procedure Dh_Reset
     (Result : out Results.Result_Type;
      Dh_Id  : Types.Dh_Id_Type)
   is
      Req  : Request.Ike.Dh_Reset.Request_Type;
      Res  : Response.Ike.Dh_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Dh_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req            := Request.Ike.Dh_Reset.Null_Request;
      Req.Data.Dh_Id := Dh_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Dh_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Dh_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Dh_Reset;

   -------------------------------------------------------------------------

   procedure Esa_Create
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Dh_Id       : Types.Dh_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type)
   is
      Req  : Request.Ike.Esa_Create.Request_Type;
      Res  : Response.Ike.Esa_Create.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Esa_Id'Valid and
              Isa_Id'Valid and
              Sp_Id'Valid and
              Ea_Id'Valid and
              Dh_Id'Valid and
              Nc_Loc_Id'Valid and
              Nonce_Rem.Size'Valid and
              Initiator'Valid and
              Esp_Spi_Loc'Valid and
              Esp_Spi_Rem'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                  := Request.Ike.Esa_Create.Null_Request;
      Req.Data.Esa_Id      := Esa_Id;
      Req.Data.Isa_Id      := Isa_Id;
      Req.Data.Sp_Id       := Sp_Id;
      Req.Data.Ea_Id       := Ea_Id;
      Req.Data.Dh_Id       := Dh_Id;
      Req.Data.Nc_Loc_Id   := Nc_Loc_Id;
      Req.Data.Nonce_Rem   := Nonce_Rem;
      Req.Data.Initiator   := Initiator;
      Req.Data.Esp_Spi_Loc := Esp_Spi_Loc;
      Req.Data.Esp_Spi_Rem := Esp_Spi_Rem;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Esa_Create.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Esa_Create.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Create;

   -------------------------------------------------------------------------

   procedure Esa_Create_First
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type)
   is
      Req  : Request.Ike.Esa_Create_First.Request_Type;
      Res  : Response.Ike.Esa_Create_First.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Esa_Id'Valid and
              Isa_Id'Valid and
              Sp_Id'Valid and
              Ea_Id'Valid and
              Esp_Spi_Loc'Valid and
              Esp_Spi_Rem'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                  := Request.Ike.Esa_Create_First.Null_Request;
      Req.Data.Esa_Id      := Esa_Id;
      Req.Data.Isa_Id      := Isa_Id;
      Req.Data.Sp_Id       := Sp_Id;
      Req.Data.Ea_Id       := Ea_Id;
      Req.Data.Esp_Spi_Loc := Esp_Spi_Loc;
      Req.Data.Esp_Spi_Rem := Esp_Spi_Rem;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Esa_Create_First.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Esa_Create_First.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Create_First;

   -------------------------------------------------------------------------

   procedure Esa_Create_No_Pfs
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type)
   is
      Req  : Request.Ike.Esa_Create_No_Pfs.Request_Type;
      Res  : Response.Ike.Esa_Create_No_Pfs.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Esa_Id'Valid and
              Isa_Id'Valid and
              Sp_Id'Valid and
              Ea_Id'Valid and
              Nc_Loc_Id'Valid and
              Nonce_Rem.Size'Valid and
              Initiator'Valid and
              Esp_Spi_Loc'Valid and
              Esp_Spi_Rem'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                  := Request.Ike.Esa_Create_No_Pfs.Null_Request;
      Req.Data.Esa_Id      := Esa_Id;
      Req.Data.Isa_Id      := Isa_Id;
      Req.Data.Sp_Id       := Sp_Id;
      Req.Data.Ea_Id       := Ea_Id;
      Req.Data.Nc_Loc_Id   := Nc_Loc_Id;
      Req.Data.Nonce_Rem   := Nonce_Rem;
      Req.Data.Initiator   := Initiator;
      Req.Data.Esp_Spi_Loc := Esp_Spi_Loc;
      Req.Data.Esp_Spi_Rem := Esp_Spi_Rem;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Esa_Create_No_Pfs.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Esa_Create_No_Pfs.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Create_No_Pfs;

   -------------------------------------------------------------------------

   procedure Esa_Reset
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type)
   is
      Req  : Request.Ike.Esa_Reset.Request_Type;
      Res  : Response.Ike.Esa_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Esa_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req             := Request.Ike.Esa_Reset.Null_Request;
      Req.Data.Esa_Id := Esa_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Esa_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Esa_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Reset;

   -------------------------------------------------------------------------

   procedure Esa_Select
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type)
   is
      Req  : Request.Ike.Esa_Select.Request_Type;
      Res  : Response.Ike.Esa_Select.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Esa_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req             := Request.Ike.Esa_Select.Null_Request;
      Req.Data.Esa_Id := Esa_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Esa_Select.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Esa_Select.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Esa_Select;

   -------------------------------------------------------------------------

   procedure Init
     (Result  : out Results.Result_Type;
      Address : Interfaces.C.Strings.chars_ptr) is separate;

   -------------------------------------------------------------------------

   procedure Isa_Auth
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Cc_Id        : Types.Cc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : Types.Signature_Type)
   is
      Req  : Request.Ike.Isa_Auth.Request_Type;
      Res  : Response.Ike.Isa_Auth.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Isa_Id'Valid and
              Cc_Id'Valid and
              Init_Message.Size'Valid and
              Signature.Size'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                   := Request.Ike.Isa_Auth.Null_Request;
      Req.Data.Isa_Id       := Isa_Id;
      Req.Data.Cc_Id        := Cc_Id;
      Req.Data.Init_Message := Init_Message;
      Req.Data.Signature    := Signature;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Isa_Auth.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Isa_Auth.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Isa_Auth;

   -------------------------------------------------------------------------

   procedure Isa_Create
     (Result    : out Results.Result_Type;
      Isa_Id    : Types.Isa_Id_Type;
      Ae_Id     : Types.Ae_Id_Type;
      Ia_Id     : Types.Ia_Id_Type;
      Dh_Id     : Types.Dh_Id_Type;
      Nc_Loc_Id : Types.Nc_Id_Type;
      Nonce_Rem : Types.Nonce_Type;
      Initiator : Types.Init_Type;
      Spi_Loc   : Types.Ike_Spi_Type;
      Spi_Rem   : Types.Ike_Spi_Type;
      Sk_Ai     : out Types.Key_Type;
      Sk_Ar     : out Types.Key_Type;
      Sk_Ei     : out Types.Key_Type;
      Sk_Er     : out Types.Key_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Isa_Create.Request_Type;
      Res  : Response.Ike.Isa_Create.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Isa_Id'Valid and
              Ae_Id'Valid and
              Ia_Id'Valid and
              Dh_Id'Valid and
              Nc_Loc_Id'Valid and
              Nonce_Rem.Size'Valid and
              Initiator'Valid and
              Spi_Loc'Valid and
              Spi_Rem'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                := Request.Ike.Isa_Create.Null_Request;
      Req.Data.Isa_Id    := Isa_Id;
      Req.Data.Ae_Id     := Ae_Id;
      Req.Data.Ia_Id     := Ia_Id;
      Req.Data.Dh_Id     := Dh_Id;
      Req.Data.Nc_Loc_Id := Nc_Loc_Id;
      Req.Data.Nonce_Rem := Nonce_Rem;
      Req.Data.Initiator := Initiator;
      Req.Data.Spi_Loc   := Spi_Loc;
      Req.Data.Spi_Rem   := Spi_Rem;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Isa_Create.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Isa_Create.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Sk_Ai := Res.Data.Sk_Ai;
         Sk_Ar := Res.Data.Sk_Ar;
         Sk_Ei := Res.Data.Sk_Ei;
         Sk_Er := Res.Data.Sk_Er;
      end if;
   end Isa_Create;

   -------------------------------------------------------------------------

   procedure Isa_Create_Child
     (Result        : out Results.Result_Type;
      Isa_Id        : Types.Isa_Id_Type;
      Parent_Isa_Id : Types.Isa_Id_Type;
      Ia_Id         : Types.Ia_Id_Type;
      Dh_Id         : Types.Dh_Id_Type;
      Nc_Loc_Id     : Types.Nc_Id_Type;
      Nonce_Rem     : Types.Nonce_Type;
      Initiator     : Types.Init_Type;
      Spi_Loc       : Types.Ike_Spi_Type;
      Spi_Rem       : Types.Ike_Spi_Type;
      Sk_Ai         : out Types.Key_Type;
      Sk_Ar         : out Types.Key_Type;
      Sk_Ei         : out Types.Key_Type;
      Sk_Er         : out Types.Key_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Isa_Create_Child.Request_Type;
      Res  : Response.Ike.Isa_Create_Child.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Isa_Id'Valid and
              Parent_Isa_Id'Valid and
              Ia_Id'Valid and
              Dh_Id'Valid and
              Nc_Loc_Id'Valid and
              Nonce_Rem.Size'Valid and
              Initiator'Valid and
              Spi_Loc'Valid and
              Spi_Rem'Valid)
      then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                    := Request.Ike.Isa_Create_Child.Null_Request;
      Req.Data.Isa_Id        := Isa_Id;
      Req.Data.Parent_Isa_Id := Parent_Isa_Id;
      Req.Data.Ia_Id         := Ia_Id;
      Req.Data.Dh_Id         := Dh_Id;
      Req.Data.Nc_Loc_Id     := Nc_Loc_Id;
      Req.Data.Nonce_Rem     := Nonce_Rem;
      Req.Data.Initiator     := Initiator;
      Req.Data.Spi_Loc       := Spi_Loc;
      Req.Data.Spi_Rem       := Spi_Rem;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Isa_Create_Child.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Isa_Create_Child.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Sk_Ai := Res.Data.Sk_Ai;
         Sk_Ar := Res.Data.Sk_Ar;
         Sk_Ei := Res.Data.Sk_Ei;
         Sk_Er := Res.Data.Sk_Er;
      end if;
   end Isa_Create_Child;

   -------------------------------------------------------------------------

   procedure Isa_Reset
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type)
   is
      Req  : Request.Ike.Isa_Reset.Request_Type;
      Res  : Response.Ike.Isa_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Isa_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req             := Request.Ike.Isa_Reset.Null_Request;
      Req.Data.Isa_Id := Isa_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Isa_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Isa_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Isa_Reset;

   -------------------------------------------------------------------------

   procedure Isa_Sign
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Lc_Id        : Types.Lc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : out Types.Signature_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Isa_Sign.Request_Type;
      Res  : Response.Ike.Isa_Sign.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Isa_Id'Valid and Lc_Id'Valid and Init_Message.Size'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                   := Request.Ike.Isa_Sign.Null_Request;
      Req.Data.Isa_Id       := Isa_Id;
      Req.Data.Lc_Id        := Lc_Id;
      Req.Data.Init_Message := Init_Message;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Isa_Sign.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Isa_Sign.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Signature := Res.Data.Signature;
      end if;
   end Isa_Sign;

   -------------------------------------------------------------------------

   procedure Isa_Skip_Create_First
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type)
   is
      Req  : Request.Ike.Isa_Skip_Create_First.Request_Type;
      Res  : Response.Ike.Isa_Skip_Create_First.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Isa_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req             := Request.Ike.Isa_Skip_Create_First.Null_Request;
      Req.Data.Isa_Id := Isa_Id;

      Transport.Client.Send_Receive
        (Req_Data =>
            Request.Ike.Isa_Skip_Create_First.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res :=
         Response.Ike.Isa_Skip_Create_First.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Isa_Skip_Create_First;

   -------------------------------------------------------------------------

   procedure Nc_Create
     (Result       : out Results.Result_Type;
      Nc_Id        : Types.Nc_Id_Type;
      Nonce_Length : Types.Nonce_Length_Type;
      Nonce        : out Types.Nonce_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Nc_Create.Request_Type;
      Res  : Response.Ike.Nc_Create.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Nc_Id'Valid and Nonce_Length'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req                   := Request.Ike.Nc_Create.Null_Request;
      Req.Data.Nc_Id        := Nc_Id;
      Req.Data.Nonce_Length := Nonce_Length;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Nc_Create.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Nc_Create.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Nonce := Res.Data.Nonce;
      end if;
   end Nc_Create;

   -------------------------------------------------------------------------

   procedure Nc_Reset
     (Result : out Results.Result_Type;
      Nc_Id  : Types.Nc_Id_Type)
   is
      Req  : Request.Ike.Nc_Reset.Request_Type;
      Res  : Response.Ike.Nc_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      if not (Nc_Id'Valid) then
         Result := Results.Invalid_Parameter;
         return;
      end if;

      Req            := Request.Ike.Nc_Reset.Null_Request;
      Req.Data.Nc_Id := Nc_Id;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Nc_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Nc_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Nc_Reset;

   -------------------------------------------------------------------------

   procedure Tkm_Limits
     (Result              : out Results.Result_Type;
      Max_Active_Requests : out Types.Active_Requests_Type;
      Nc_Contexts         : out Types.Nc_Id_Type;
      Dh_Contexts         : out Types.Dh_Id_Type;
      Cc_Contexts         : out Types.Cc_Id_Type;
      Ae_Contexts         : out Types.Ae_Id_Type;
      Isa_Contexts        : out Types.Isa_Id_Type;
      Esa_Contexts        : out Types.Esa_Id_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Tkm_Limits.Request_Type;
      Res  : Response.Ike.Tkm_Limits.Response_Type;
      Data : Response.Data_Type;
   begin
      Req := Request.Ike.Tkm_Limits.Null_Request;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Tkm_Limits.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Tkm_Limits.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Max_Active_Requests := Res.Data.Max_Active_Requests;
         Nc_Contexts         := Res.Data.Nc_Contexts;
         Dh_Contexts         := Res.Data.Dh_Contexts;
         Cc_Contexts         := Res.Data.Cc_Contexts;
         Ae_Contexts         := Res.Data.Ae_Contexts;
         Isa_Contexts        := Res.Data.Isa_Contexts;
         Esa_Contexts        := Res.Data.Esa_Contexts;
      end if;
   end Tkm_Limits;

   -------------------------------------------------------------------------

   procedure Tkm_Reset (Result : out Results.Result_Type) is
      Req  : Request.Ike.Tkm_Reset.Request_Type;
      Res  : Response.Ike.Tkm_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req := Request.Ike.Tkm_Reset.Null_Request;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Tkm_Reset.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Tkm_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Tkm_Reset;

   -------------------------------------------------------------------------

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Ike.Tkm_Version.Request_Type;
      Res  : Response.Ike.Tkm_Version.Response_Type;
      Data : Response.Data_Type;
   begin
      Req := Request.Ike.Tkm_Version.Null_Request;

      Transport.Client.Send_Receive
        (Req_Data => Request.Ike.Tkm_Version.Convert.To_Request (S => Req),
         Res_Data => Data);
      Res := Response.Ike.Tkm_Version.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
      if Result = Results.Ok then
         Version := Res.Data.Version;
      end if;
   end Tkm_Version;

end Tkmrpc.Clients.Ike;
