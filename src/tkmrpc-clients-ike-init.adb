separate (TKMRPC.Clients.IKE)

procedure Init (Result : out Results.Result_Type)
is
begin
   Transport.Client.Connect (Address => Communication_Socket);
   Result := Results.OK;

exception
   when others =>
      Result := Results.Invalid_Operation;
end Init;
