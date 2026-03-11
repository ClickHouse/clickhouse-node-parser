SELECT
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_bloom_filter'
    AND active
ORDER BY column ASC;

SELECT COUNT()
FROM t_bloom_filter
WHERE key = 1;

SELECT COUNT()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_bloom_filter'
    AND secondary_indices_uncompressed_bytes > 200
    AND active;