with TKMRPC.Response;
with TKMRPC.Results;

package TKMRPC.Constants
is

   Invalid_Operation : constant Response.Data_Type;
   --  Invalid operation response.

private

   Invalid_Operation : constant Response.Data_Type
     := (Header      =>
           (Operation  => Results.Invalid_Operation,
            others     => <>),
         Padded_Data => (others => <>));

end TKMRPC.Constants;
