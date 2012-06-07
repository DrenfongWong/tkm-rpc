with TKMRPC.Transport.Client;
with TKMRPC.Operations.CFG;
with TKMRPC.Request.CFG.tkm_version.Convert;
with TKMRPC.Request.CFG.tkm_limits.Convert;
with TKMRPC.Response.CFG.tkm_version.Convert;
with TKMRPC.Response.CFG.tkm_limits.Convert;

package body TKMRPC.Clients.CFG
is

   -------------------------------------------------------------------------

   procedure Init
     (Result  : out Results.Result_Type;
      Address :     Interfaces.C.Strings.chars_ptr) is separate;

   -------------------------------------------------------------------------

   procedure tkm_limits
     (max_active_requests : out Types.active_requests_type;
      authag_contexts : out Types.authag_id_type;
      cag_contexts : out Types.cag_id_type;
      li_contexts : out Types.li_id_type;
      ri_contexts : out Types.ri_id_type;
      iag_contexts : out Types.iag_id_type;
      eag_contexts : out Types.eag_id_type;
      dhag_contexts : out Types.dhag_id_type;
      sp_contexts : out Types.sp_id_type;
      authp_contexts : out Types.authp_id_type;
      dhp_contexts : out Types.dhp_id_type;
      autha_contexts : out Types.autha_id_type;
      ca_contexts : out Types.ca_id_type;
      lc_contexts : out Types.lc_id_type;
      ia_contexts : out Types.ia_id_type;
      ea_contexts : out Types.ea_id_type;
      dha_contexts : out Types.dha_id_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.CFG.tkm_limits.Request_Type;
      Res  : Response.CFG.tkm_limits.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.CFG.tkm_limits;

      Transport.Client.Send
        (Data => Request.CFG.tkm_limits.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.CFG.tkm_limits.Convert.From_Response
        (S => Data);

      max_active_requests := Res.Data.max_active_requests;
      authag_contexts := Res.Data.authag_contexts;
      cag_contexts := Res.Data.cag_contexts;
      li_contexts := Res.Data.li_contexts;
      ri_contexts := Res.Data.ri_contexts;
      iag_contexts := Res.Data.iag_contexts;
      eag_contexts := Res.Data.eag_contexts;
      dhag_contexts := Res.Data.dhag_contexts;
      sp_contexts := Res.Data.sp_contexts;
      authp_contexts := Res.Data.authp_contexts;
      dhp_contexts := Res.Data.dhp_contexts;
      autha_contexts := Res.Data.autha_contexts;
      ca_contexts := Res.Data.ca_contexts;
      lc_contexts := Res.Data.lc_contexts;
      ia_contexts := Res.Data.ia_contexts;
      ea_contexts := Res.Data.ea_contexts;
      dha_contexts := Res.Data.dha_contexts;
      Result := Res.Header.Result;
   end tkm_limits;

   -------------------------------------------------------------------------

   procedure tkm_version
     (version : out Types.version_type;
      Result : out Results.Result_Type)
   is
      use type TKMRPC.Results.Result_Type;

      Req  : Request.CFG.tkm_version.Request_Type;
      Res  : Response.CFG.tkm_version.Response_Type;
      Data : Response.Data_Type;
   begin
      Req.Header.Operation := Operations.CFG.tkm_version;

      Transport.Client.Send
        (Data => Request.CFG.tkm_version.Convert.To_Request
           (S => Req));
      Transport.Client.Receive (Data => Data);
      Res := Response.CFG.tkm_version.Convert.From_Response
        (S => Data);

      version := Res.Data.version;
      Result := Res.Header.Result;
   end tkm_version;

end TKMRPC.Clients.CFG;
