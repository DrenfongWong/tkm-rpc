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

with Tkmrpc.Types;

package Tkmrpc.Mock
is

   Ref_Nonce : constant Types.Nonce_Type
     := (Size => 156,
         Data => (others => Character'Pos ('f')));
   --  Reference nonce returned by Nc_Create function.

   Last_Nonce_Id     : Types.Nc_Id_Type        := Types.Nc_Id_Type'Last;
   Last_Nonce_Length : Types.Nonce_Length_Type := 16;
   --  Calls to Nc_Create will set these vars to the last requested nonce Id
   --  and length.

   Ref_Dh_Pubvalue : constant Types.Dh_Pubvalue_Type
     := (Size => 8,
         Data => (others => 16#3b#));
   --  Reference Diffie-Hellman public value checked in Dh_Generate_Key
   --  procedure.

end Tkmrpc.Mock;
