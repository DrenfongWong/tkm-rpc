with Tkmrpc.Request.Convert;
with Tkmrpc.Response.Convert;

procedure Tkmrpc.Process_Stream
  (Recv_Data :     Ada.Streams.Stream_Element_Array;
   Send_Data : out Ada.Streams.Stream_Element_Array;
   Send_Last : out Ada.Streams.Stream_Element_Offset)
is
   use type Ada.Streams.Stream_Element_Offset;

   Req : constant Tkmrpc.Request.Data_Type
     := Tkmrpc.Request.Convert.From_Stream (S => Recv_Data);
   Res : Tkmrpc.Response.Data_Type;
begin
   begin
      Dispatch (Req => Req,
                Res => Res);

   exception
      when E : others =>
         Exception_Handler (Ex => E);

         Res                   := Tkmrpc.Response.Null_Data;
         Res.Header.Request_Id := Req.Header.Request_Id;
   end;

   Send_Last := Res'Size / 8;
   Send_Data (Send_Data'First .. Send_Last)
     := Tkmrpc.Response.Convert.To_Stream (S => Res);
end Tkmrpc.Process_Stream;
