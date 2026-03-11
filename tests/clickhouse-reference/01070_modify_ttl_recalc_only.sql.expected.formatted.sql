SELECT *
FROM ttl
ORDER BY a ASC;

SELECT
    delete_ttl_info_min,
    delete_ttl_info_max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND active > 0
ORDER BY name ASC;

SELECT *
FROM ttl
ORDER BY i ASC;

SELECT
    delete_ttl_info_min,
    delete_ttl_info_max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND active > 0;

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