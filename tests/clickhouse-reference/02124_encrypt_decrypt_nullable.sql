SELECT aes_encrypt_mysql('aes-256-ecb', CAST(null as Nullable(String)), 'test_key________________________');
SELECT aes_decrypt_mysql('aes-256-ecb', CAST(null as Nullable(String)), 'test_key________________________');
