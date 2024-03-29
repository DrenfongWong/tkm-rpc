--
--  Copyright (C) 2013 Reto Buerki <reet@codelabs.ch>
--  Copyright (C) 2013 Adrian-Ken Rueegsegger <ken@codelabs.ch>
--  All rights reserved.
--
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above copyright
--     notice, this list of conditions and the following disclaimer in the
--     documentation and/or other materials provided with the distribution.
--  3. Neither the name of the University nor the names of its contributors
--     may be used to endorse or promote products derived from this software
--     without specific prior written permission.
--
--  THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
--  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
--  ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
--  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
--  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
--  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
--  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
--  SUCH DAMAGE.
--

with Tkmrpc.Request.Convert;
with Tkmrpc.Response;
with Tkmrpc.Operations.Ike;
with Tkmrpc.Operation_Handlers.Ike.Nc_Create;
with Tkmrpc.Results;
with Tkmrpc.Types;

with Test_Utils;

package body Tkmrpc_Request_Tests
is
   use Ahven;
   use Tkmrpc;

   -------------------------------------------------------------------------

   procedure Initialize (T : in out Testcase)
   is
   begin
      T.Set_Name (Name => "Request tests");
      T.Add_Test_Routine
        (Routine => Stream_Conversion'Access,
         Name    => "To/from stream conversions");
      T.Add_Test_Routine
        (Routine => Request_Validation'Access,
         Name    => "Request validation");
   end Initialize;

   -------------------------------------------------------------------------

   procedure Request_Validation
   is
      use type Tkmrpc.Results.Result_Type;

      Invalid_Id  : constant Request.Data_Type
        := (Header      => (Operation => Operations.Ike.Nc_Create,
                            Request_Id => 1),
            Padded_Data => (others => 0));
      Invalid_Len : constant Request.Data_Type
        := (Header      => (Operation => Operations.Ike.Nc_Create,
                            Request_Id => 1),
            Padded_Data => (0, 0, 0, 0, 0, 0, 0, 1,
                            16#ff#, 16#ff#, 16#ff#, 16#ff#, 16#ff#, 16#ff#,
                            16#ff#, 16#ff#, others => 0));
      Res         : Response.Data_Type := Tkmrpc.Response.Null_Data;
   begin
      Tkmrpc.Operation_Handlers.Ike.Nc_Create.Handle
        (Req => Invalid_Id,
         Res => Res);
      Assert (Condition => Res.Header.Result = Results.Invalid_Parameter,
              Message   => "Invalid Nc_Create request not caugth (nc_id)");

      Tkmrpc.Operation_Handlers.Ike.Nc_Create.Handle
        (Req => Invalid_Len,
         Res => Res);
      Assert
        (Condition => Res.Header.Result = Results.Invalid_Parameter,
         Message   => "Invalid Nc_Create request not caugth (nonce_length)");
   end Request_Validation;

   -------------------------------------------------------------------------

   procedure Stream_Conversion
   is
      use Tkmrpc.Request;
      use type Tkmrpc.Operations.Operation_Type;
      use type Tkmrpc.Request.Padded_Data_Type;
      use type Tkmrpc.Types.Request_Id_Type;

      Stream : constant Convert.Stream_Type
        := Convert.To_Stream (S => Test_Utils.Test_Request);
      Req    : constant Data_Type        := Convert.From_Stream (S => Stream);
      Data   : constant Padded_Data_Type := (others => Character'Pos ('a'));
   begin
      Assert (Condition => Req.Header.Operation = Test_Utils.Test_Operation,
              Message   => "Operation mismatch");
      Assert (Condition => Req.Header.Request_Id = 234234234,
              Message   => "Request ID mismatch");
      Assert (Condition => Req.Padded_Data = Data,
              Message   => "Data mismatch");
   end Stream_Conversion;

end Tkmrpc_Request_Tests;
