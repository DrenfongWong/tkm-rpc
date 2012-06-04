with Interfaces;

package TKMRPC.Types
is
   subtype Byte is Interfaces.Unsigned_8;

   type Byte_Array is array (Natural range <>) of Byte;

   subtype Request_ID_Type is Interfaces.Unsigned_64;

end TKMRPC.Types;
