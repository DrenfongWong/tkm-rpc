with Tkmrpc.Operations.Ike;
with Tkmrpc.Operation_Handlers.Ike.Tkm_Version;
with Tkmrpc.Operation_Handlers.Ike.Tkm_Limits;
with Tkmrpc.Operation_Handlers.Ike.Tkm_Reset;
with Tkmrpc.Operation_Handlers.Ike.Nc_Reset;
with Tkmrpc.Operation_Handlers.Ike.Nc_Create;
with Tkmrpc.Operation_Handlers.Ike.Dh_Reset;
with Tkmrpc.Operation_Handlers.Ike.Dh_Create;
with Tkmrpc.Operation_Handlers.Ike.Dh_Generate_Key;
with Tkmrpc.Operation_Handlers.Ike.Cc_Reset;
with Tkmrpc.Operation_Handlers.Ike.Cc_Set_User_Certificate;
with Tkmrpc.Operation_Handlers.Ike.Cc_Add_Certificate;
with Tkmrpc.Operation_Handlers.Ike.Cc_Check_Ca;
with Tkmrpc.Operation_Handlers.Ike.Ae_Reset;
with Tkmrpc.Operation_Handlers.Ike.Isa_Reset;
with Tkmrpc.Operation_Handlers.Ike.Isa_Create;
with Tkmrpc.Operation_Handlers.Ike.Isa_Sign;
with Tkmrpc.Operation_Handlers.Ike.Isa_Sign_Psk;
with Tkmrpc.Operation_Handlers.Ike.Isa_Auth;
with Tkmrpc.Operation_Handlers.Ike.Isa_Auth_Psk;
with Tkmrpc.Operation_Handlers.Ike.Isa_Create_Child;
with Tkmrpc.Operation_Handlers.Ike.Isa_Skip_Create_First;
with Tkmrpc.Operation_Handlers.Ike.Esa_Reset;
with Tkmrpc.Operation_Handlers.Ike.Esa_Create;
with Tkmrpc.Operation_Handlers.Ike.Esa_Create_No_Pfs;
with Tkmrpc.Operation_Handlers.Ike.Esa_Create_First;
with Tkmrpc.Operation_Handlers.Ike.Esa_Select;

package body Tkmrpc.Dispatchers.Ike is

   -------------------------------------------------------------------------

   procedure Dispatch
     (Req : Request.Data_Type;
      Res : out Response.Data_Type)
   is
   begin
      case Req.Header.Operation is
      when Operations.Ike.Tkm_Version =>
         Operation_Handlers.Ike.Tkm_Version.Handle (Req => Req, Res => Res);
      when Operations.Ike.Tkm_Limits =>
         Operation_Handlers.Ike.Tkm_Limits.Handle (Req => Req, Res => Res);
      when Operations.Ike.Tkm_Reset =>
         Operation_Handlers.Ike.Tkm_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Nc_Reset =>
         Operation_Handlers.Ike.Nc_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Nc_Create =>
         Operation_Handlers.Ike.Nc_Create.Handle (Req => Req, Res => Res);
      when Operations.Ike.Dh_Reset =>
         Operation_Handlers.Ike.Dh_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Dh_Create =>
         Operation_Handlers.Ike.Dh_Create.Handle (Req => Req, Res => Res);
      when Operations.Ike.Dh_Generate_Key =>
         Operation_Handlers.Ike.Dh_Generate_Key.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Cc_Reset =>
         Operation_Handlers.Ike.Cc_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Cc_Set_User_Certificate =>
         Operation_Handlers.Ike.Cc_Set_User_Certificate.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Cc_Add_Certificate =>
         Operation_Handlers.Ike.Cc_Add_Certificate.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Cc_Check_Ca =>
         Operation_Handlers.Ike.Cc_Check_Ca.Handle (Req => Req, Res => Res);
      when Operations.Ike.Ae_Reset =>
         Operation_Handlers.Ike.Ae_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Reset =>
         Operation_Handlers.Ike.Isa_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Create =>
         Operation_Handlers.Ike.Isa_Create.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Sign =>
         Operation_Handlers.Ike.Isa_Sign.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Sign_Psk =>
         Operation_Handlers.Ike.Isa_Sign_Psk.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Auth =>
         Operation_Handlers.Ike.Isa_Auth.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Auth_Psk =>
         Operation_Handlers.Ike.Isa_Auth_Psk.Handle (Req => Req, Res => Res);
      when Operations.Ike.Isa_Create_Child =>
         Operation_Handlers.Ike.Isa_Create_Child.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Isa_Skip_Create_First =>
         Operation_Handlers.Ike.Isa_Skip_Create_First.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Esa_Reset =>
         Operation_Handlers.Ike.Esa_Reset.Handle (Req => Req, Res => Res);
      when Operations.Ike.Esa_Create =>
         Operation_Handlers.Ike.Esa_Create.Handle (Req => Req, Res => Res);
      when Operations.Ike.Esa_Create_No_Pfs =>
         Operation_Handlers.Ike.Esa_Create_No_Pfs.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Esa_Create_First =>
         Operation_Handlers.Ike.Esa_Create_First.Handle
           (Req => Req,
            Res => Res);
      when Operations.Ike.Esa_Select =>
         Operation_Handlers.Ike.Esa_Select.Handle (Req => Req, Res => Res);
      when others =>
         Res                  := Response.Null_Data;
         Res.Header.Operation := Req.Header.Operation;
      end case;

      Res.Header.Request_Id := Req.Header.Request_Id;
   end Dispatch;

end Tkmrpc.Dispatchers.Ike;
