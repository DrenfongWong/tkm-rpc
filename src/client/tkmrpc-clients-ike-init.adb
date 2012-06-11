separate (Tkmrpc.Clients.Ike)

procedure Init
  (Result  : out Results.Result_Type;
   Address :     Interfaces.C.Strings.chars_ptr)
is
   Socket_Address : constant String := Interfaces.C.Strings.Value
     (Item => Address);
begin
   Transport.Client.Connect (Address => Socket_Address);
   Result := Results.Ok;

exception
   when others =>
      Result := Results.Invalid_Operation;
end Init;