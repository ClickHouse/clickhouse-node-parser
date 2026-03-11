SELECT
    hex(hmac('md5', 'The quick brown fox jumps over the lazy dog', 'secret_key')) AS hmac_md5,
    hex(Hmac('sha1', 'The quick brown fox jumps over the lazy dog', 'secret_key')) AS hmac_sha1,
    hex(HMac('sha224', 'The quick brown fox jumps over the lazy dog', 'secret_key')) AS hmac_sha224,
    hex(HMAc('sha256', 'The quick brown fox jumps over the lazy dog', 'secret_key')) AS hmac_sha256,
    hex(hmAc('sha384', 'The quick brown fox jumps over the lazy dog', 'secret_key')) AS hmac_sha384,
    hex(HMAC('sha512', 'The quick brown fox jumps over the lazy dog', 'secret_key')) AS hmac_sha512
FORMAT Vertical;

SELECT length(HMAC('md4', 'test', 'key'));

SELECT length(HMAC('md5', 'test', 'key'));

SELECT length(HMAC('mdc2', 'test', 'key'));

SELECT length(HMAC('ripemd', 'test', 'key'));

SELECT length(HMAC('sha1', 'test', 'key'));

SELECT length(HMAC('sha224', 'test', 'key'));

SELECT length(HMAC('sha256', 'test', 'key'));

SELECT length(HMAC('sha384', 'test', 'key'));

SELECT length(HMAC('sha512', 'test', 'key'));

SELECT length(HMAC('sha512-224', 'test', 'key'));

SELECT length(HMAC('sha512-256', 'test', 'key'));

SELECT length(HMAC('sha3-224', 'test', 'key'));

SELECT length(HMAC('sha3-256', 'test', 'key'));

SELECT length(HMAC('sha3-384', 'test', 'key'));

SELECT length(HMAC('sha3-512', 'test', 'key'));

SELECT length(HMAC('blake2b512', 'test', 'key'));

SELECT length(HMAC('blake2s256', 'test', 'key'));

SELECT length(HMAC('sm3', 'test', 'key'));

SELECT length(HMAC('whirlpool', 'test', 'key'));

SELECT length(HMAC('sha256', '', 'key')) = 32;

SELECT length(HMAC('sha256', 'message', '')) = 32;

SELECT length(HMAC('sha256', '', '')) = 32;

SELECT
    message,
    key,
    hex(HMAC('sha256', message, key)) AS hmac_hex
FROM hmac_test
ORDER BY message ASC;

SELECT HMAC('invalid_algo', 'message', 'key');

SELECT hmac('sha256', toString(number), 'key')
FROM `system`.numbers
LIMIT 100000
FORMAT Null;