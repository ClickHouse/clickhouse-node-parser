-- TTL should not be applied
SELECT *
FROM ttl
ORDER BY a ASC;

SELECT *
FROM ttl
ORDER BY i ASC;

SELECT
    i,
    s
FROM ttl
ORDER BY i ASC;