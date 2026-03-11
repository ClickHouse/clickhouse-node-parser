SELECT aes_encrypt_mysql();

SELECT aes_encrypt_mysql('aes-128-ecb');

SELECT aes_encrypt_mysql('aes-128-ecb', 'text');

SELECT aes_encrypt_mysql(789, 'text', 'key');

SELECT aes_encrypt_mysql('blah blah blah', 'text', 'key');

SELECT aes_encrypt_mysql('des-ede3-ecb', 'text', 'key');

SELECT aes_encrypt_mysql('aes-128-gcm', 'text', 'key');

SELECT encrypt(789, 'text', 'key');

SELECT encrypt('blah blah blah', 'text', 'key');

SELECT encrypt('des-ede3-ecb', 'text', 'key');

SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 456);

SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key');

SELECT encrypt('aes-128-ecb', 'text');

SELECT encrypt('aes-128-ecb', 'text', 456);

SELECT encrypt('aes-128-ecb', 'text', 'key');

SELECT encrypt('aes-128-ecb', 'text', 'keykeykeykeykeykeykeykeykeykeykeykey');

SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key', 1011);

SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key', 'iv');

SELECT encrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 1011);

SELECT encrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 'iviviviviviviviviviviviviviviviviviviviviv');

SELECT encrypt('aes-128-cbc', 'text', 'keykeykeykeykeyk', 'iv');

SELECT aes_encrypt_mysql('aes-128-ecb', 'text', 'key', 'IV', 1213);

SELECT encrypt('aes-128-ecb', 'text', 'key', 'IV', 1213);

SELECT encrypt('aes-128-gcm', 'text', 'key', 'IV', 1213);

SELECT
    'aes-128-cbc' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-192-cbc' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-256-cbc' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-ecb' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-192-ecb' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-256-ecb' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-ofb' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-192-ofb' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-256-ofb' AS mode,
    hex(aes_encrypt_mysql(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-cbc' AS mode,
    hex(encrypt(mode, input, key16, iv))
FROM encryption_test;

SELECT
    'aes-192-cbc' AS mode,
    hex(encrypt(mode, input, key24, iv))
FROM encryption_test;

SELECT
    'aes-256-cbc' AS mode,
    hex(encrypt(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-ctr' AS mode,
    hex(encrypt(mode, input, key16, iv))
FROM encryption_test;

SELECT
    'aes-192-ctr' AS mode,
    hex(encrypt(mode, input, key24, iv))
FROM encryption_test;

SELECT
    'aes-256-ctr' AS mode,
    hex(encrypt(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-ecb' AS mode,
    hex(encrypt(mode, input, key16))
FROM encryption_test;

SELECT
    'aes-192-ecb' AS mode,
    hex(encrypt(mode, input, key24))
FROM encryption_test;

SELECT
    'aes-256-ecb' AS mode,
    hex(encrypt(mode, input, key32))
FROM encryption_test;

SELECT
    'aes-128-ofb' AS mode,
    hex(encrypt(mode, input, key16, iv))
FROM encryption_test;

SELECT
    'aes-192-ofb' AS mode,
    hex(encrypt(mode, input, key24, iv))
FROM encryption_test;

SELECT
    'aes-256-ofb' AS mode,
    hex(encrypt(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-gcm' AS mode,
    hex(encrypt(mode, input, key16, iv))
FROM encryption_test;

SELECT
    'aes-192-gcm' AS mode,
    hex(encrypt(mode, input, key24, iv))
FROM encryption_test;

SELECT
    'aes-256-gcm' AS mode,
    hex(encrypt(mode, input, key32, iv))
FROM encryption_test;

SELECT
    'aes-128-gcm' AS mode,
    hex(encrypt(mode, input, key16, iv, 'AAD'))
FROM encryption_test;

SELECT
    'aes-192-gcm' AS mode,
    hex(encrypt(mode, input, key24, iv, 'AAD'))
FROM encryption_test;

SELECT
    'aes-256-gcm' AS mode,
    hex(encrypt(mode, input, key32, iv, 'AAD'))
FROM encryption_test;