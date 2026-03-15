CREATE TABLE t_sparse_detach
(
    id UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9, enable_block_number_column = 0, enable_block_offset_column = 0;

SELECT count()
FROM t_sparse_detach
WHERE s != '';

SELECT
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE table = 't_sparse_detach'
    AND database = currentDatabase()
    AND active
ORDER BY column ASC;