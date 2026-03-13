SELECT sum(secondary_indices_compressed_bytes) > 0
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_index'
    AND active;

SELECT count()
FROM t_index
WHERE data.a = 1
SETTINGS force_data_skipping_indices = 'a_idx';

SELECT count()
FROM t_index
WHERE data.b::UInt64 = 11
SETTINGS force_data_skipping_indices = 'b_idx';

SELECT column
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_index'
    AND active;

-- Check that column 'data' was materialized on MATERIALIZE INDEX query.
SELECT column
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_index'
    AND active
ORDER BY column ASC;