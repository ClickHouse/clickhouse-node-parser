SELECT
    name,
    column,
    type,
    column_ttl_min,
    column_ttl_max
FROM `system`.parts_columns
WHERE table = 'test_03143'
    AND database = currentDatabase()
ORDER BY
    name ASC,
    column ASC;