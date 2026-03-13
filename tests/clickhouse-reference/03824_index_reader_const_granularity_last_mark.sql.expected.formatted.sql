-- This query triggers lazy materialization with index reader as the first reader in the chain.
-- The bug was that the index reader reported 64 rows for the last granule (instead of 16),
-- causing a mismatch with the actual data reader.
SELECT
    id,
    v1
FROM tab
ORDER BY v1 DESC
LIMIT 257
SETTINGS
    use_skip_indexes_for_top_k = 1,
    use_skip_indexes_on_data_read = 0;