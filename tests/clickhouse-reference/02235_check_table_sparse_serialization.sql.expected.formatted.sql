CREATE TABLE t_sparse_02235
(
    a UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;

INSERT INTO t_sparse_02235 SELECT 1
FROM numbers(1000);

INSERT INTO t_sparse_02235 SELECT 0
FROM numbers(1000);

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