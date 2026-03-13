SELECT sleep(1)
FORMAT Null; -- wait if very fast merge happen

SELECT *
FROM ttl
ORDER BY
    d ASC,
    a ASC;