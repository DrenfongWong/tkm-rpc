with Tkmrpc.Transport.Client;
with Tkmrpc.Operations.Cfg;
with Tkmrpc.Request.Cfg.Tkm_Version.Convert;
with Tkmrpc.Request.Cfg.Tkm_Limits.Convert;
with Tkmrpc.Request.Cfg.Tkm_Reset.Convert;
with Tkmrpc.Response.Cfg.Tkm_Version.Convert;
with Tkmrpc.Response.Cfg.Tkm_Limits.Convert;
with Tkmrpc.Response.Cfg.Tkm_Reset.Convert;

package body Tkmrpc.Clients.Cfg is

   -------------------------------------------------------------------------

   procedure Init
     (Result  : out Results.Result_Type;
      Address : Interfaces.C.Strings.chars_ptr) is separate;

   -------------------------------------------------------------------------

   procedure Tkm_Limits
     (Result              : out Results.Result_Type;
      Max_Active_Requests : out Types.Active_Requests_Type;
      Authag_Contexts     : out Types.Authag_Id_Type;
      Cag_Contexts        : out Types.Cag_Id_Type;
      Li_Contexts         : out Types.Li_Id_Type;
      Ri_Contexts         : out Types.Ri_Id_Type;
      Iag_Contexts        : out Types.Iag_Id_Type;
      Eag_Contexts        : out Types.Eag_Id_Type;
      Dhag_Contexts       : out Types.Dhag_Id_Type;
      Sp_Contexts         : out Types.Sp_Id_Type;
      Authp_Contexts      : out Types.Authp_Id_Type;
      Dhp_Contexts        : out Types.Dhp_Id_Type;
      Autha_Contexts      : out Types.Autha_Id_Type;
      Ca_Contexts         : out Types.Ca_Id_Type;
      Lc_Contexts         : out Types.Lc_Id_Type;
      Ia_Contexts         : out Types.Ia_Id_Type;
      Ea_Contexts         : out Types.Ea_Id_Type;
      Dha_Contexts        : out Types.Dha_Id_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Cfg.Tkm_Limits.Request_Type;
      Res  : Response.Cfg.Tkm_Limits.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.Cfg.Tkm_Limits;

      Transport.Client.Send
        (Data => Request.Cfg.Tkm_Limits.Convert.To_Request (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.Cfg.Tkm_Limits.Convert.From_Response (S => Data);

      Max_Active_Requests := Res.Data.Max_Active_Requests;
      Authag_Contexts     := Res.Data.Authag_Contexts;
      Cag_Contexts        := Res.Data.Cag_Contexts;
      Li_Contexts         := Res.Data.Li_Contexts;
      Ri_Contexts         := Res.Data.Ri_Contexts;
      Iag_Contexts        := Res.Data.Iag_Contexts;
      Eag_Contexts        := Res.Data.Eag_Contexts;
      Dhag_Contexts       := Res.Data.Dhag_Contexts;
      Sp_Contexts         := Res.Data.Sp_Contexts;
      Authp_Contexts      := Res.Data.Authp_Contexts;
      Dhp_Contexts        := Res.Data.Dhp_Contexts;
      Autha_Contexts      := Res.Data.Autha_Contexts;
      Ca_Contexts         := Res.Data.Ca_Contexts;
      Lc_Contexts         := Res.Data.Lc_Contexts;
      Ia_Contexts         := Res.Data.Ia_Contexts;
      Ea_Contexts         := Res.Data.Ea_Contexts;
      Dha_Contexts        := Res.Data.Dha_Contexts;
      Result              := Res.Header.Result;
   end Tkm_Limits;

   -------------------------------------------------------------------------

   procedure Tkm_Reset (Result : out Results.Result_Type) is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Cfg.Tkm_Reset.Request_Type;
      Res  : Response.Cfg.Tkm_Reset.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.Cfg.Tkm_Reset;

      Transport.Client.Send
        (Data => Request.Cfg.Tkm_Reset.Convert.To_Request (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.Cfg.Tkm_Reset.Convert.From_Response (S => Data);

      Result := Res.Header.Result;
   end Tkm_Reset;

   -------------------------------------------------------------------------

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type)
   is
      use type Tkmrpc.Results.Result_Type;

      Req  : Request.Cfg.Tkm_Version.Request_Type;
      Res  : Response.Cfg.Tkm_Version.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.Cfg.Tkm_Version;

      Transport.Client.Send
        (Data => Request.Cfg.Tkm_Version.Convert.To_Request (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.Cfg.Tkm_Version.Convert.From_Response (S => Data);

      Version := Res.Data.Version;
      Result  := Res.Header.Result;
   end Tkm_Version;

end Tkmrpc.Clients.Cfg;
