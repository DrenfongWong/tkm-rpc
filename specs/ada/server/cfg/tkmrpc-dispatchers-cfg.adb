with Tkmrpc.Operations.Cfg;
with Tkmrpc.Operation_Handlers.Cfg.Tkm_Version;
with Tkmrpc.Operation_Handlers.Cfg.Tkm_Limits;
with Tkmrpc.Operation_Handlers.Cfg.Tkm_Reset;

package body Tkmrpc.Dispatchers.Cfg is

   -------------------------------------------------------------------------

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type)
   is
   begin
      case Req.Header.Operation is
         when Operations.Cfg.Tkm_Version =>
            Operation_Handlers.Cfg.Tkm_Version.Handle
              (Req => Req,
               Res => Res);
         when Operations.Cfg.Tkm_Limits =>
            Operation_Handlers.Cfg.Tkm_Limits.Handle (Req => Req, Res => Res);
         when Operations.Cfg.Tkm_Reset =>
            Operation_Handlers.Cfg.Tkm_Reset.Handle (Req => Req, Res => Res);
         when others =>
            Res                  := Response.Null_Data;
            Res.Header.Operation := Req.Header.Operation;
      end case;

      Res.Header.Request_Id := Req.Header.Request_Id;
   end Dispatch;

end Tkmrpc.Dispatchers.Cfg;
