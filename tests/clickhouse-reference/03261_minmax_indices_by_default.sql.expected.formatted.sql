-- Expect x_idx and two implicit minmax indices
SELECT
    name,
    type,
    expr,
    data_compressed_bytes
FROM `system`.data_skipping_indices
WHERE table = 'tbl1'
    AND database = currentDatabase();

SELECT
    name,
    type,
    expr,
    data_compressed_bytes
FROM `system`.data_skipping_indices
WHERE table = 'tbl6'
    AND database = currentDatabase();