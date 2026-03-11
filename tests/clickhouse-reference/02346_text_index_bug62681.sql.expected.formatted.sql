SELECT
    database,
    table,
    name,
    type,
    type_full,
    granularity,
    data_compressed_bytes > 100,
    data_uncompressed_bytes > 75,
    marks_bytes
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND type = 'text'
FORMAT Vertical;

SELECT
    `partition`,
    name,
    secondary_indices_compressed_bytes > 150,
    secondary_indices_uncompressed_bytes > 100,
    secondary_indices_marks_bytes
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active = 1
    AND `partition` = 'tuple()'
FORMAT Vertical;