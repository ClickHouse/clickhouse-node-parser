-- Cache a result of a query with secret in the query cache
SELECT hex(encrypt('aes-128-ecb', 'plaintext', 'passwordpassword')) SETTINGS use_query_cache = true;
-- The secret should not be revealed in system.query_cache
SELECT query FROM system.query_cache;
