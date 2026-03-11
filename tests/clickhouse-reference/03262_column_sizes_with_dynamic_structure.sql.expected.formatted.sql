SELECT
    table,
    sum(`rows`) AS `rows`,
    floor(sum(data_uncompressed_bytes) / ((1024 * 1024))) AS data_size_uncompressed,
    floor(sum(data_compressed_bytes) / ((1024 * 1024))) AS data_size_compressed,
    floor(sum(bytes_on_disk) / ((1024 * 1024))) AS total_size_on_disk
FROM `system`.parts
WHERE active
    AND (database = currentDatabase())
    AND (table = 'test')
GROUP BY table
ORDER BY table ASC;