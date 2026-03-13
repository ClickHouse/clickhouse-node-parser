-- Compare the size of the text index for the same dataset with vs. without compression.
SELECT
    table,
    sum(`rows`),
    sum(secondary_indices_compressed_bytes)
FROM `system`.parts
WHERE database = currentDatabase()
    AND active
    AND table IN ('tab_bitpacking', 'tab_uncompressed')
GROUP BY table;