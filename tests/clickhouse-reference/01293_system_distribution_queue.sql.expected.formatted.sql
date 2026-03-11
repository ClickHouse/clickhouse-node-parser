SELECT *
FROM `system`.distribution_queue
WHERE database = currentDatabase();

SELECT
    is_blocked,
    error_count,
    data_files,
    data_compressed_bytes > 100,
    broken_data_files,
    broken_data_compressed_bytes
FROM `system`.distribution_queue
WHERE database = currentDatabase();

SELECT
    is_blocked,
    error_count,
    data_files,
    data_compressed_bytes,
    broken_data_files,
    broken_data_compressed_bytes
FROM `system`.distribution_queue
WHERE database = currentDatabase();