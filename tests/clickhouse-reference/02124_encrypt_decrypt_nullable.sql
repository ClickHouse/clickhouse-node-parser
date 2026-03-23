SELECT aes_encrypt_mysql('aes-256-ecb', CAST(null as Nullable(String)), 'test_key________________________');
WITH 'aes-256-ecb' as mode, 'Hello World!' as plaintext, 'test_key________________________' as key
SELECT hex(aes_encrypt_mysql(mode, toNullable(plaintext), key));
SELECT aes_decrypt_mysql('aes-256-ecb', CAST(null as Nullable(String)), 'test_key________________________');
WITH 'aes-256-ecb' as mode, unhex('D1B43643E1D0E9390E39BA4EAE150851') as ciphertext, 'test_key________________________' as key
SELECT hex(aes_decrypt_mysql(mode, toNullable(ciphertext), key));
WITH 'aes-256-ecb' as mode, 'test_key________________________' as key
SELECT mode, encrypt(mode, CAST(null as Nullable(String)), key);
WITH 'aes-256-gcm' as mode, 'test_key________________________' as key, 'test_iv_____' as iv
SELECT mode, encrypt(mode, CAST(null as Nullable(String)), key, iv);
WITH 'aes-256-ecb' as mode, 'test_key________________________' as key
SELECT mode, hex(encrypt(mode, toNullable('Hello World!'), key));
WITH 'aes-256-gcm' as mode, 'test_key________________________' as key, 'test_iv_____' as iv
SELECT mode, hex(encrypt(mode, toNullable('Hello World!'), key, iv));
WITH 'aes-256-ecb' as mode, 'test_key________________________' as key
SELECT mode, decrypt(mode, CAST(null as Nullable(String)), key);
WITH 'aes-256-gcm' as mode, 'test_key________________________' as key, 'test_iv_____' as iv
SELECT mode, decrypt(mode, CAST(null as Nullable(String)), key, iv);
WITH 'aes-256-ecb' as mode, unhex('D1B43643E1D0E9390E39BA4EAE150851') as ciphertext, 'test_key________________________' as key
SELECT mode, decrypt(mode, toNullable(ciphertext), key);
WITH 'aes-256-gcm' as mode, unhex('219E6478A1A3BB5B686DA4BAD70323F192EFEDCCBBD6F49E78A7E2F6') as ciphertext, 'test_key________________________' as key, 'test_iv_____' as iv
SELECT mode, decrypt(mode, toNullable(ciphertext), key, iv);
