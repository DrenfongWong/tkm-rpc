with Tkmrpc.Servers.Ike;
with Tkmrpc.Results;
with Tkmrpc.Request.Ike.Isa_Skip_Create_First.Convert;
with Tkmrpc.Response.Ike.Isa_Skip_Create_First.Convert;

package body Tkmrpc.Operation_Handlers.Ike.Isa_Skip_Create_First is

   -------------------------------------------------------------------------

   procedure Handle (Req : Request.Data_Type; Res : out Response.Data_Type) is
      Specific_Req : Request.Ike.Isa_Skip_Create_First.Request_Type;
      Specific_Res : Response.Ike.Isa_Skip_Create_First.Response_Type;
   begin
      Specific_Res := Response.Ike.Isa_Skip_Create_First.Null_Response;

      Specific_Req :=
         Request.Ike.Isa_Skip_Create_First.Convert.From_Request (S => Req);

      if Specific_Req.Data.Isa_Id'Valid then
         Servers.Ike.Isa_Skip_Create_First
           (Result => Specific_Res.Header.Result,
            Isa_Id => Specific_Req.Data.Isa_Id);

         Res :=
            Response.Ike.Isa_Skip_Create_First.Convert.To_Response
              (S => Specific_Res);

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Skip_Create_First;
