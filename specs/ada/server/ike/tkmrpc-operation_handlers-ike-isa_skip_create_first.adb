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

      --# accept W, 13,
      --#        Request.IKE.isa_skip_create_first.Convert.From_Request,
      --#        "Validity is assured by preconditions";
      Specific_Req :=
         Request.Ike.Isa_Skip_Create_First.Convert.From_Request (S => Req);
      --# end accept;

      if Specific_Req.Data.Isa_Id'Valid then
         Servers.Ike.Isa_Skip_Create_First
           (Result => Specific_Res.Header.Result,
            Isa_Id => Specific_Req.Data.Isa_Id);

         --# accept W, 13,
         --#        Response.IKE.isa_skip_create_first.Convert.To_Response,
         --#        "Validity is assured by preconditions";
         Res :=
            Response.Ike.Isa_Skip_Create_First.Convert.To_Response
              (S => Specific_Res);
      --# end accept;

      else
         Res.Header.Result := Results.Invalid_Parameter;
      end if;
   end Handle;

end Tkmrpc.Operation_Handlers.Ike.Isa_Skip_Create_First;
