CREATE TABLE t_sparse_02235
(
    a UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;

SELECT
    name,
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_02235'
ORDER BY
    name ASC,
    column ASC;