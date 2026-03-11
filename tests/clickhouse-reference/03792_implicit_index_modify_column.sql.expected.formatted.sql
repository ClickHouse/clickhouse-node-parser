SELECT
    name,
    type_full,
    expr,
    creation,
    data_compressed_bytes > 0
FROM `system`.data_skipping_indices
WHERE database = current_database()
    AND table = 'test_alter'
ORDER BY name ASC;