SELECT hex(encrypt('aes-128-ecb', 'plaintext', 'passwordpassword'))
SETTINGS use_query_cache = true;

SELECT query
FROM `system`.query_cache;