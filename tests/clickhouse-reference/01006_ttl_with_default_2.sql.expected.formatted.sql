SELECT sleep(0.7)
FORMAT Null; -- wait if very fast merge happen

SELECT a
FROM ttl_with_default
ORDER BY a ASC;