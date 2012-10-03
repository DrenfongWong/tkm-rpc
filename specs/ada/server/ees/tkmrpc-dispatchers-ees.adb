with Tkmrpc.Operations.Ees;
with Tkmrpc.Operation_Handlers.Ees.Esa_Acquire;
with Tkmrpc.Operation_Handlers.Ees.Esa_Expire;

package body Tkmrpc.Dispatchers.Ees is

   -------------------------------------------------------------------------

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type)
   is
   begin
      case Req.Header.Operation is
         when Operations.Ees.Esa_Acquire =>
            Operation_Handlers.Ees.Esa_Acquire.Handle
              (Req => Req,
               Res => Res);
         when Operations.Ees.Esa_Expire =>
            Operation_Handlers.Ees.Esa_Expire.Handle (Req => Req, Res => Res);
         when others =>
            Res                  := Response.Null_Data;
            Res.Header.Operation := Req.Header.Operation;
      end case;

      Res.Header.Request_Id := Req.Header.Request_Id;
   end Dispatch;

end Tkmrpc.Dispatchers.Ees;
