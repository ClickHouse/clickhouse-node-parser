SELECT aes_decrypt_mysql();

SELECT aes_decrypt_mysql('aes-128-ecb');

SELECT aes_decrypt_mysql('aes-128-ecb', 'text');

SELECT aes_decrypt_mysql(789, 'text', 'key');

SELECT aes_decrypt_mysql('blah blah blah', 'text', 'key');

SELECT aes_decrypt_mysql('des-ede3-ecb', 'text', 'key');

SELECT aes_decrypt_mysql('aes-128-gcm', 'text', 'key');

SELECT decrypt(789, 'text', 'key');

SELECT decrypt('blah blah blah', 'text', 'key');

SELECT decrypt('des-ede3-ecb', 'text', 'key');

SELECT aes_decrypt_mysql('aes-128-ecb', 'text', 456);

SELECT aes_decrypt_mysql('aes-128-ecb', 'text', 'key');

SELECT decrypt('aes-128-ecb', 'text');

SELECT decrypt('aes-128-ecb', 'text', 456);

SELECT decrypt('aes-128-ecb', 'text', 'key');

SELECT decrypt('aes-128-ecb', 'text', 'keykeykeykeykeykeykeykeykeykeykeykey');

SELECT aes_decrypt_mysql('aes-128-ecb', 'text', 'key', 1011);

SELECT aes_decrypt_mysql('aes-128-ecb', 'text', 'key', 'iv');

SELECT decrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 1011);

SELECT decrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 'iviviviviviviviviviviviviviviviviviviviviv');

SELECT decrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 'iv');

SELECT aes_decrypt_mysql('aes-128-ecb', 'text', 'key', 'IV', 1213);

SELECT decrypt('aes-128-ecb', 'text', 'key', 'IV', 1213);

SELECT decrypt('aes-128-gcm', 'text', 'key', 'IV', 1213);

SELECT ignore(decrypt('aes-128-ecb', 'hello there', '1111111111111111'));

SELECT ignore(decrypt('aes-128-cbc', 'hello there', '1111111111111111'));

SELECT ignore(decrypt('aes-128-ofb', 'hello there', '1111111111111111'));

SELECT ignore(decrypt('aes-128-ctr', 'hello there', '1111111111111111'));

SELECT decrypt('aes-128-ctr', '', '1111111111111111') == '';

SELECT
    'aes-128-cbc' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-192-cbc' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-256-cbc' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-128-ecb' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-192-ecb' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-256-ecb' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-128-ofb' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-192-ofb' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-256-ofb' AS mode,
    aes_decrypt_mysql(mode, aes_encrypt_mysql(mode, input, key, iv), key, iv) == input
FROM encryption_test;

SELECT
    'aes-128-cbc' AS mode,
    decrypt(mode, encrypt(mode, input, key16, iv), key16, iv) == input
FROM encryption_test;

SELECT
    'aes-192-cbc' AS mode,
    decrypt(mode, encrypt(mode, input, key24, iv), key24, iv) == input
FROM encryption_test;

SELECT
    'aes-256-cbc' AS mode,
    decrypt(mode, encrypt(mode, input, key32, iv), key32, iv) == input
FROM encryption_test;

SELECT
    'aes-128-ctr' AS mode,
    decrypt(mode, encrypt(mode, input, key16, iv), key16, iv) == input
FROM encryption_test;

SELECT
    'aes-192-ctr' AS mode,
    decrypt(mode, encrypt(mode, input, key24, iv), key24, iv) == input
FROM encryption_test;

SELECT
    'aes-256-ctr' AS mode,
    decrypt(mode, encrypt(mode, input, key32, iv), key32, iv) == input
FROM encryption_test;

SELECT
    'aes-128-ecb' AS mode,
    decrypt(mode, encrypt(mode, input, key16), key16) == input
FROM encryption_test;

SELECT
    'aes-192-ecb' AS mode,
    decrypt(mode, encrypt(mode, input, key24), key24) == input
FROM encryption_test;

SELECT
    'aes-256-ecb' AS mode,
    decrypt(mode, encrypt(mode, input, key32), key32) == input
FROM encryption_test;

SELECT
    'aes-128-ofb' AS mode,
    decrypt(mode, encrypt(mode, input, key16, iv), key16, iv) == input
FROM encryption_test;

SELECT
    'aes-192-ofb' AS mode,
    decrypt(mode, encrypt(mode, input, key24, iv), key24, iv) == input
FROM encryption_test;

SELECT
    'aes-256-ofb' AS mode,
    decrypt(mode, encrypt(mode, input, key32, iv), key32, iv) == input
FROM encryption_test;

SELECT
    'aes-128-gcm' AS mode,
    decrypt(mode, encrypt(mode, input, key16, iv), key16, iv) == input
FROM encryption_test;

SELECT
    'aes-192-gcm' AS mode,
    decrypt(mode, encrypt(mode, input, key24, iv), key24, iv) == input
FROM encryption_test;

SELECT
    'aes-256-gcm' AS mode,
    decrypt(mode, encrypt(mode, input, key32, iv), key32, iv) == input
FROM encryption_test;

SELECT
    'aes-128-gcm' AS mode,
    decrypt(mode, encrypt(mode, input, key16, iv, 'AAD'), key16, iv, 'AAD') == input
FROM encryption_test;

SELECT
    'aes-192-gcm' AS mode,
    decrypt(mode, encrypt(mode, input, key24, iv, 'AAD'), key24, iv, 'AAD') == input
FROM encryption_test;

SELECT
    'aes-256-gcm' AS mode,
    decrypt(mode, encrypt(mode, input, key32, iv, 'AAD'), key32, iv, 'AAD') == input
FROM encryption_test;

SELECT
    dt,
    user_id
FROM decrypt_null
WHERE (user_id > 0)
    AND (decrypt('aes-256-gcm', encrypted, 'keykeykeykeykeykeykeykeykeykey02', iv) = 'value2');

SELECT
    dt,
    user_id
FROM decrypt_null
WHERE (user_id > 0)
    AND (tryDecrypt('aes-256-gcm', encrypted, 'keykeykeykeykeykeykeykeykeykey02', iv) = 'value2');

SELECT
    dt,
    user_id,
    (tryDecrypt('aes-256-gcm', encrypted, 'keykeykeykeykeykeykeykeykeykey02', iv)) AS value
FROM decrypt_null
ORDER BY user_id ASC;