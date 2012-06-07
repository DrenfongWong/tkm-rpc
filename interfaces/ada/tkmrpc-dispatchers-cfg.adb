with TKMRPC.Operations.CFG;
with TKMRPC.Operation_Handlers.CFG.tkm_version;
with TKMRPC.Operation_Handlers.CFG.tkm_limits;

package body TKMRPC.Dispatchers.CFG
is

   -------------------------------------------------------------------------

   procedure Dispatch
     (Req :     Request.Data_Type;
      Res : out Response.Data_Type)
   is
   begin
      case Req.Header.Operation is
         when Operations.CFG.tkm_version =>
            Operation_Handlers.CFG.tkm_version.Handle
              (Req => Req,
               Res => Res);
         when Operations.CFG.tkm_limits =>
            Operation_Handlers.CFG.tkm_limits.Handle
              (Req => Req,
               Res => Res);
         when others =>
            Res := Response.Null_Data;
      end case;

      Res.Header.Request_ID := Req.Header.Request_ID;
   end Dispatch;

end TKMRPC.Dispatchers.CFG;
