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

SELECT
    i,
    s,
    t
FROM ttl
ORDER BY i ASC;

SELECT count()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND is_done;