-- Tags: no-fasttest
-- Tag no-fasttest: Depends on OpenSSL

--- aes_encrypt_mysql(string, key, block_mode[, init_vector, AAD])
-- The MySQL-compatitable encryption, only ecb, cbc and ofb modes are supported,
-- just like for MySQL
-- https://dev.mysql.com/doc/refman/8.0/en/encryption-functions.html#function_aes-encrypt
-- https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_block_encryption_mode
-- Please note that for keys that exceed mode-specific length, keys are folded in a MySQL-specific way,
-- meaning that whole key is used, but effective key length is still determined by mode.
-- when key doesn't exceed the default mode length, ecryption result equals with AES_encypt()

-----------------------------------------------------------------------------------------
-- error cases
-----------------------------------------------------------------------------------------
SELECT aes_encrypt_mysql(); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH} not enough arguments
SELECT aes_encrypt_mysql('aes-128-ecb'); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH} not enough arguments
SELECT aes_encrypt_mysql('aes-128-ecb', 'text'); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH} not enough arguments
-- Mode
SELECT aes_encrypt_mysql(789, 'text', 'key'); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad mode type
SELECT aes_encrypt_mysql('blah blah blah', 'text', 'key'); -- {serverError BAD_ARGUMENTS} garbage mode value
SELECT aes_encrypt_mysql('des-ede3-ecb', 'text', 'key'); -- {serverError BAD_ARGUMENTS} bad mode value of valid cipher name
SELECT aes_encrypt_mysql('aes-128-gcm', 'text', 'key'); -- {serverError BAD_ARGUMENTS} mode is not supported by _mysql-functions
SELECT encrypt(789, 'text', 'key'); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad mode type
SELECT encrypt('blah blah blah', 'text', 'key'); -- {serverError BAD_ARGUMENTS} garbage mode value
SELECT encrypt('des-ede3-ecb', 'text', 'key'); -- {serverError BAD_ARGUMENTS} bad mode value of valid cipher name
-- Key
SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 456); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad key type
SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key'); -- {serverError BAD_ARGUMENTS} key is too short
SELECT encrypt('aes-128-ecb', 'text'); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH} key is missing
SELECT encrypt('aes-128-ecb', 'text', 456); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad key type
SELECT encrypt('aes-128-ecb', 'text', 'key'); -- {serverError BAD_ARGUMENTS} key is too short
SELECT encrypt('aes-128-ecb', 'text', 'keykeykeykeykeykeykeykeykeykeykeykey'); -- {serverError BAD_ARGUMENTS} key is to long
-- IV
SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key', 1011); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad IV type 6
SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key', 'iv'); --{serverError BAD_ARGUMENTS} IV is too short 4
SELECT encrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 1011); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad IV type 1
SELECT encrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 'iviviviviviviviviviviviviviviviviviviviviv'); --{serverError BAD_ARGUMENTS} IV is too long 3
SELECT encrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 'iv'); --{serverError BAD_ARGUMENTS} IV is too short 2
--AAD
SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key', 'IV', 1213); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH} too many arguments
SELECT encrypt('aes-128-ecb', 'text', 'key', 'IV', 1213); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad AAD type
SELECT encrypt('aes-128-gcm', 'text', 'key', 'IV', 1213); --{serverError ILLEGAL_TYPE_OF_ARGUMENT} bad AAD type
SELECT 'aes-128-cbc' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-192-cbc' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-256-cbc' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-ecb' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-192-ecb' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-256-ecb' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-ofb' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-192-ofb' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-256-ofb' as mode, hex(aes_encrypt_mysql(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-cbc' as mode, hex(encrypt(mode, input, key16, iv)) FROM encryption_test;
SELECT 'aes-192-cbc' as mode, hex(encrypt(mode, input, key24, iv)) FROM encryption_test;
SELECT 'aes-256-cbc' as mode, hex(encrypt(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-ctr' as mode, hex(encrypt(mode, input, key16, iv)) FROM encryption_test;
SELECT 'aes-192-ctr' as mode, hex(encrypt(mode, input, key24, iv)) FROM encryption_test;
SELECT 'aes-256-ctr' as mode, hex(encrypt(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-ecb' as mode, hex(encrypt(mode, input, key16)) FROM encryption_test;
SELECT 'aes-192-ecb' as mode, hex(encrypt(mode, input, key24)) FROM encryption_test;
SELECT 'aes-256-ecb' as mode, hex(encrypt(mode, input, key32)) FROM encryption_test;
SELECT 'aes-128-ofb' as mode, hex(encrypt(mode, input, key16, iv)) FROM encryption_test;
SELECT 'aes-192-ofb' as mode, hex(encrypt(mode, input, key24, iv)) FROM encryption_test;
SELECT 'aes-256-ofb' as mode, hex(encrypt(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-gcm' as mode, hex(encrypt(mode, input, key16, iv)) FROM encryption_test;
SELECT 'aes-192-gcm' as mode, hex(encrypt(mode, input, key24, iv)) FROM encryption_test;
SELECT 'aes-256-gcm' as mode, hex(encrypt(mode, input, key32, iv)) FROM encryption_test;
SELECT 'aes-128-gcm' as mode, hex(encrypt(mode, input, key16, iv, 'AAD')) FROM encryption_test;
SELECT 'aes-192-gcm' as mode, hex(encrypt(mode, input, key24, iv, 'AAD')) FROM encryption_test;
SELECT 'aes-256-gcm' as mode, hex(encrypt(mode, input, key32, iv, 'AAD')) FROM encryption_test;
