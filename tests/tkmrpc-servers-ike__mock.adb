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

with Tkmrpc.Mock;

package body Tkmrpc.Servers.Ike is

   -------------------------------------------------------------------------

   procedure Ae_Reset
     (Result : out Results.Result_Type;
      Ae_Id  : Types.Ae_Id_Type)
   is
      pragma Unreferenced (Ae_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Ae_Reset;

   -------------------------------------------------------------------------

   procedure Cc_Add_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type)
   is
      pragma Unreferenced (Cc_Id);
      pragma Unreferenced (Autha_Id);
      pragma Unreferenced (Certificate);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Cc_Add_Certificate;

   -------------------------------------------------------------------------

   procedure Cc_Check_Ca
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type;
      Ca_Id  : Types.Ca_Id_Type)
   is
      pragma Unreferenced (Cc_Id);
      pragma Unreferenced (Ca_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Cc_Check_Ca;

   -------------------------------------------------------------------------

   procedure Cc_Reset
     (Result : out Results.Result_Type;
      Cc_Id  : Types.Cc_Id_Type)
   is
      pragma Unreferenced (Cc_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Cc_Reset;

   -------------------------------------------------------------------------

   procedure Cc_Set_User_Certificate
     (Result      : out Results.Result_Type;
      Cc_Id       : Types.Cc_Id_Type;
      Ri_Id       : Types.Ri_Id_Type;
      Autha_Id    : Types.Autha_Id_Type;
      Certificate : Types.Certificate_Type)
   is
      pragma Unreferenced (Cc_Id);
      pragma Unreferenced (Ri_Id);
      pragma Unreferenced (Autha_Id);
      pragma Unreferenced (Certificate);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Cc_Set_User_Certificate;

   -------------------------------------------------------------------------

   procedure Dh_Create
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Dha_Id   : Types.Dha_Id_Type;
      Pubvalue : out Types.Dh_Pubvalue_Type)
   is
      pragma Unreferenced (Dh_Id);
      pragma Unreferenced (Dha_Id);
      pragma Unreferenced (Pubvalue);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Dh_Create;

   -------------------------------------------------------------------------

   procedure Dh_Generate_Key
     (Result   : out Results.Result_Type;
      Dh_Id    : Types.Dh_Id_Type;
      Pubvalue : Types.Dh_Pubvalue_Type)
   is
      pragma Unreferenced (Dh_Id);
      use type Types.Byte_Sequence;

      Size : constant Natural := Natural (Pubvalue.Size);
   begin
      if Pubvalue.Size = Mock.Ref_Dh_Pubvalue.Size and then
        Pubvalue.Data (1 .. Size) = Mock.Ref_Dh_Pubvalue.Data (1 .. Size)
      then
         Result := Results.Ok;
      else
         Result := Results.Invalid_Parameter;
      end if;
   end Dh_Generate_Key;

   -------------------------------------------------------------------------

   procedure Dh_Reset
     (Result : out Results.Result_Type;
      Dh_Id  : Types.Dh_Id_Type)
   is
      pragma Unreferenced (Dh_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Dh_Reset;

   -------------------------------------------------------------------------

   procedure Esa_Create
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Dh_Id       : Types.Dh_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type)
   is
      pragma Unreferenced (Esa_Id);
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Sp_Id);
      pragma Unreferenced (Ea_Id);
      pragma Unreferenced (Dh_Id);
      pragma Unreferenced (Nc_Loc_Id);
      pragma Unreferenced (Nonce_Rem);
      pragma Unreferenced (Initiator);
      pragma Unreferenced (Esp_Spi_Loc);
      pragma Unreferenced (Esp_Spi_Rem);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Esa_Create;

   -------------------------------------------------------------------------

   procedure Esa_Create_First
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type)
   is
      pragma Unreferenced (Esa_Id);
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Sp_Id);
      pragma Unreferenced (Ea_Id);
      pragma Unreferenced (Esp_Spi_Loc);
      pragma Unreferenced (Esp_Spi_Rem);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Esa_Create_First;

   -------------------------------------------------------------------------

   procedure Esa_Create_No_Pfs
     (Result      : out Results.Result_Type;
      Esa_Id      : Types.Esa_Id_Type;
      Isa_Id      : Types.Isa_Id_Type;
      Sp_Id       : Types.Sp_Id_Type;
      Ea_Id       : Types.Ea_Id_Type;
      Nc_Loc_Id   : Types.Nc_Id_Type;
      Nonce_Rem   : Types.Nonce_Type;
      Initiator   : Types.Init_Type;
      Esp_Spi_Loc : Types.Esp_Spi_Type;
      Esp_Spi_Rem : Types.Esp_Spi_Type)
   is
      pragma Unreferenced (Esa_Id);
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Sp_Id);
      pragma Unreferenced (Ea_Id);
      pragma Unreferenced (Nc_Loc_Id);
      pragma Unreferenced (Nonce_Rem);
      pragma Unreferenced (Initiator);
      pragma Unreferenced (Esp_Spi_Loc);
      pragma Unreferenced (Esp_Spi_Rem);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Esa_Create_No_Pfs;

   -------------------------------------------------------------------------

   procedure Esa_Reset
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type)
   is
      pragma Unreferenced (Esa_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Esa_Reset;

   -------------------------------------------------------------------------

   procedure Esa_Select
     (Result : out Results.Result_Type;
      Esa_Id : Types.Esa_Id_Type)
   is
      pragma Unreferenced (Esa_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Esa_Select;

   -------------------------------------------------------------------------

   procedure Finalize
   is
   begin
      null;
   end Finalize;

   -------------------------------------------------------------------------

   procedure Init
   is
   begin
      null;
   end Init;

   -------------------------------------------------------------------------

   procedure Isa_Auth
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Cc_Id        : Types.Cc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : Types.Signature_Type)
   is
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Cc_Id);
      pragma Unreferenced (Init_Message);
      pragma Unreferenced (Signature);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Isa_Auth;

   -------------------------------------------------------------------------

   procedure Isa_Create
     (Result    : out Results.Result_Type;
      Isa_Id    : Types.Isa_Id_Type;
      Ae_Id     : Types.Ae_Id_Type;
      Ia_Id     : Types.Ia_Id_Type;
      Dh_Id     : Types.Dh_Id_Type;
      Nc_Loc_Id : Types.Nc_Id_Type;
      Nonce_Rem : Types.Nonce_Type;
      Initiator : Types.Init_Type;
      Spi_Loc   : Types.Ike_Spi_Type;
      Spi_Rem   : Types.Ike_Spi_Type;
      Sk_Ai     : out Types.Key_Type;
      Sk_Ar     : out Types.Key_Type;
      Sk_Ei     : out Types.Key_Type;
      Sk_Er     : out Types.Key_Type)
   is
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Ae_Id);
      pragma Unreferenced (Ia_Id);
      pragma Unreferenced (Dh_Id);
      pragma Unreferenced (Nc_Loc_Id);
      pragma Unreferenced (Nonce_Rem);
      pragma Unreferenced (Initiator);
      pragma Unreferenced (Spi_Loc);
      pragma Unreferenced (Spi_Rem);
      pragma Unreferenced (Sk_Ai);
      pragma Unreferenced (Sk_Ar);
      pragma Unreferenced (Sk_Ei);
      pragma Unreferenced (Sk_Er);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Isa_Create;

   -------------------------------------------------------------------------

   procedure Isa_Create_Child
     (Result        : out Results.Result_Type;
      Isa_Id        : Types.Isa_Id_Type;
      Parent_Isa_Id : Types.Isa_Id_Type;
      Ia_Id         : Types.Ia_Id_Type;
      Dh_Id         : Types.Dh_Id_Type;
      Nc_Loc_Id     : Types.Nc_Id_Type;
      Nonce_Rem     : Types.Nonce_Type;
      Initiator     : Types.Init_Type;
      Spi_Loc       : Types.Ike_Spi_Type;
      Spi_Rem       : Types.Ike_Spi_Type;
      Sk_Ai         : out Types.Key_Type;
      Sk_Ar         : out Types.Key_Type;
      Sk_Ei         : out Types.Key_Type;
      Sk_Er         : out Types.Key_Type)
   is
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Parent_Isa_Id);
      pragma Unreferenced (Ia_Id);
      pragma Unreferenced (Dh_Id);
      pragma Unreferenced (Nc_Loc_Id);
      pragma Unreferenced (Nonce_Rem);
      pragma Unreferenced (Initiator);
      pragma Unreferenced (Spi_Loc);
      pragma Unreferenced (Spi_Rem);
      pragma Unreferenced (Sk_Ai);
      pragma Unreferenced (Sk_Ar);
      pragma Unreferenced (Sk_Ei);
      pragma Unreferenced (Sk_Er);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Isa_Create_Child;

   -------------------------------------------------------------------------

   procedure Isa_Reset
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type)
   is
      pragma Unreferenced (Isa_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Isa_Reset;

   -------------------------------------------------------------------------

   procedure Isa_Sign
     (Result       : out Results.Result_Type;
      Isa_Id       : Types.Isa_Id_Type;
      Lc_Id        : Types.Lc_Id_Type;
      Init_Message : Types.Init_Message_Type;
      Signature    : out Types.Signature_Type)
   is
      pragma Unreferenced (Isa_Id);
      pragma Unreferenced (Lc_Id);
      pragma Unreferenced (Init_Message);
      pragma Unreferenced (Signature);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Isa_Sign;

   -------------------------------------------------------------------------

   procedure Isa_Skip_Create_First
     (Result : out Results.Result_Type;
      Isa_Id : Types.Isa_Id_Type)
   is
      pragma Unreferenced (Isa_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Isa_Skip_Create_First;

   -------------------------------------------------------------------------

   procedure Nc_Create
     (Result       : out Results.Result_Type;
      Nc_Id        : Types.Nc_Id_Type;
      Nonce_Length : Types.Nonce_Length_Type;
      Nonce        : out Types.Nonce_Type)
   is
   begin
      Mock.Last_Nonce_Id     := Nc_Id;
      Mock.Last_Nonce_Length := Nonce_Length;

      Nonce  := Mock.Ref_Nonce;
      Result := Results.Ok;
   end Nc_Create;

   -------------------------------------------------------------------------

   procedure Nc_Reset
     (Result : out Results.Result_Type;
      Nc_Id  : Types.Nc_Id_Type)
   is
      pragma Unreferenced (Nc_Id);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Nc_Reset;

   -------------------------------------------------------------------------

   procedure Tkm_Limits
     (Result              : out Results.Result_Type;
      Max_Active_Requests : out Types.Active_Requests_Type;
      Nc_Contexts         : out Types.Nc_Id_Type;
      Dh_Contexts         : out Types.Dh_Id_Type;
      Cc_Contexts         : out Types.Cc_Id_Type;
      Ae_Contexts         : out Types.Ae_Id_Type;
      Isa_Contexts        : out Types.Isa_Id_Type;
      Esa_Contexts        : out Types.Esa_Id_Type)
   is
      pragma Unreferenced (Max_Active_Requests);
      pragma Unreferenced (Nc_Contexts);
      pragma Unreferenced (Dh_Contexts);
      pragma Unreferenced (Cc_Contexts);
      pragma Unreferenced (Ae_Contexts);
      pragma Unreferenced (Isa_Contexts);
      pragma Unreferenced (Esa_Contexts);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Tkm_Limits;

   -------------------------------------------------------------------------

   procedure Tkm_Reset (Result : out Results.Result_Type)
   is
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Tkm_Reset;

   -------------------------------------------------------------------------

   procedure Tkm_Version
     (Result  : out Results.Result_Type;
      Version : out Types.Version_Type)
   is
      pragma Unreferenced (Version);
   begin

      --  Auto-generated stub.

      Result := Results.Invalid_Operation;
   end Tkm_Version;

end Tkmrpc.Servers.Ike;
