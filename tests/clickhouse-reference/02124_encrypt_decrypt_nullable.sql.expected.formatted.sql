SELECT aes_encrypt_mysql('aes-256-ecb', CAST(NULL AS Nullable(String)), 'test_key________________________');

SELECT aes_decrypt_mysql('aes-256-ecb', CAST(NULL AS Nullable(String)), 'test_key________________________');