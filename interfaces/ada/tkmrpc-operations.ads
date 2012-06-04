with Interfaces;

package TKMRPC.Operations
is
   subtype Operation_Type is Interfaces.Unsigned_64;

   subtype Nonce_Operation_Type is Operation_Type range 16#100# .. 16#101#;

   Nonce_Reset  : constant Nonce_Operation_Type := 16#100#;
   Nonce_Create : constant Nonce_Operation_Type := 16#101#;

end TKMRPC.Operations;
