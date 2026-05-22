SELECT aes_encrypt_mysql('aes-256-ecb', CAST(NULL AS Nullable(String)), 'test_key________________________');

WITH 'aes-256-ecb' AS mode,

'Hello World!' AS plaintext,

'test_key________________________' AS key

SELECT hex(aes_encrypt_mysql(mode, toNullable(plaintext), key));

SELECT aes_decrypt_mysql('aes-256-ecb', CAST(NULL AS Nullable(String)), 'test_key________________________');

WITH 'aes-256-ecb' AS mode,

unhex('D1B43643E1D0E9390E39BA4EAE150851') AS ciphertext,

'test_key________________________' AS key

SELECT hex(aes_decrypt_mysql(mode, toNullable(ciphertext), key));

WITH 'aes-256-ecb' AS mode,

'test_key________________________' AS key

SELECT
    mode,
    encrypt(mode, CAST(NULL AS Nullable(String)), key);

WITH 'aes-256-gcm' AS mode,

'test_key________________________' AS key,

'test_iv_____' AS iv

SELECT
    mode,
    encrypt(mode, CAST(NULL AS Nullable(String)), key, iv);

WITH 'aes-256-ecb' AS mode,

'test_key________________________' AS key

SELECT
    mode,
    hex(encrypt(mode, toNullable('Hello World!'), key));

WITH 'aes-256-gcm' AS mode,

'test_key________________________' AS key,

'test_iv_____' AS iv

SELECT
    mode,
    hex(encrypt(mode, toNullable('Hello World!'), key, iv));

WITH 'aes-256-ecb' AS mode,

'test_key________________________' AS key

SELECT
    mode,
    decrypt(mode, CAST(NULL AS Nullable(String)), key);

WITH 'aes-256-gcm' AS mode,

'test_key________________________' AS key,

'test_iv_____' AS iv

SELECT
    mode,
    decrypt(mode, CAST(NULL AS Nullable(String)), key, iv);

WITH 'aes-256-ecb' AS mode,

unhex('D1B43643E1D0E9390E39BA4EAE150851') AS ciphertext,

'test_key________________________' AS key

SELECT
    mode,
    decrypt(mode, toNullable(ciphertext), key);

WITH 'aes-256-gcm' AS mode,

unhex('219E6478A1A3BB5B686DA4BAD70323F192EFEDCCBBD6F49E78A7E2F6') AS ciphertext,

'test_key________________________' AS key,

'test_iv_____' AS iv

SELECT
    mode,
    decrypt(mode, toNullable(ciphertext), key, iv);