with Interfaces;

package TKMRPC.Types
is

   subtype Byte is Interfaces.Unsigned_8;

   subtype Byte_Sequence_Range is Natural range 0 .. 2 ** 31 - 2;

   type Byte_Sequence is array (Byte_Sequence_Range range <>) of Byte;

   type request_id_type is new Interfaces.Unsigned_64;

   type version_type is new Interfaces.Unsigned_64;

   type active_requests_type is new Interfaces.Unsigned_64;

   type authag_id_type is new Interfaces.Unsigned_64;

   type cag_id_type is new Interfaces.Unsigned_64;

   type li_id_type is new Interfaces.Unsigned_64;

   type ri_id_type is new Interfaces.Unsigned_64;

   type iag_id_type is new Interfaces.Unsigned_64;

   type eag_id_type is new Interfaces.Unsigned_64;

   type dhag_id_type is new Interfaces.Unsigned_64;

   type sp_id_type is new Interfaces.Unsigned_64;

   type authp_id_type is new Interfaces.Unsigned_64;

   type dhp_id_type is new Interfaces.Unsigned_64;

   type autha_id_type is new Interfaces.Unsigned_64;

   type ca_id_type is new Interfaces.Unsigned_64;

   type lc_id_type is new Interfaces.Unsigned_64;

   type ia_id_type is new Interfaces.Unsigned_64;

   type ea_id_type is new Interfaces.Unsigned_64;

   type dha_id_type is new Interfaces.Unsigned_64;

   type nc_id_type is new Interfaces.Unsigned_64;

   type dh_id_type is new Interfaces.Unsigned_64;

   type cc_id_type is new Interfaces.Unsigned_64;

   type ae_id_type is new Interfaces.Unsigned_64;

   type isa_id_type is new Interfaces.Unsigned_64;

   type esa_id_type is new Interfaces.Unsigned_64;

   type abs_time_type is new Interfaces.Unsigned_64;

   type rel_time_type is new Interfaces.Unsigned_64;

   type duration_type is new Interfaces.Unsigned_64;

   type counter_type is new Interfaces.Unsigned_64;

   type pfs_flag_type is new Interfaces.Unsigned_64;

   type cc_time_flag_type is new Interfaces.Unsigned_64;

   type auth_algorithm_type is new Interfaces.Unsigned_64;

   type dh_algorithm_type is new Interfaces.Unsigned_64;

   type iprf_algorithm_type is new Interfaces.Unsigned_64;

   type iint_algorithm_type is new Interfaces.Unsigned_64;

   type ienc_algorithm_type is new Interfaces.Unsigned_64;

   type eprf_algorithm_type is new Interfaces.Unsigned_64;

   type eint_algorithm_type is new Interfaces.Unsigned_64;

   type eenc_algorithm_type is new Interfaces.Unsigned_64;

   type key_length_bits_type is new Interfaces.Unsigned_64;

   type block_length_bits_type is new Interfaces.Unsigned_64;

   type init_type is new Interfaces.Unsigned_64;

   type ike_spi_type is new Interfaces.Unsigned_64;

   type esp_spi_type is new Interfaces.Unsigned_32;

   type nonce_length_type is new Interfaces.Unsigned_64;

   type init_message_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 1500) := (others => 0);
   end record;
   for init_message_type'Size use 1504 * 8;

   type certificate_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 1024) := (others => 0);
   end record;
   for certificate_type'Size use 1028 * 8;

   type nonce_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for nonce_type'Size use 260 * 8;

   type dh_pubvalue_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for dh_pubvalue_type'Size use 260 * 8;

   type dh_priv_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for dh_priv_type'Size use 260 * 8;

   type dh_key_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for dh_key_type'Size use 260 * 8;

   type key_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 64) := (others => 0);
   end record;
   for key_type'Size use 68 * 8;

   type identity_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 64) := (others => 0);
   end record;
   for identity_type'Size use 68 * 8;

   type signature_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 256) := (others => 0);
   end record;
   for signature_type'Size use 260 * 8;

   type auth_parameter_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 1024) := (others => 0);
   end record;
   for auth_parameter_type'Size use 1028 * 8;

   type dh_parameter_type is record
      Size : Interfaces.Unsigned_32 := 0;
      Data : Byte_Sequence (1 .. 1024) := (others => 0);
   end record;
   for dh_parameter_type'Size use 1028 * 8;

end TKMRPC.Types;
