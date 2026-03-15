SET optimize_trivial_insert_select = 1;

CREATE TABLE t_sparse
(
    id UInt64,
    u UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9, index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE table = 't_sparse'
    AND database = currentDatabase()
ORDER BY
    column ASC,
    serialization_kind ASC;

SELECT count()
FROM t_sparse
WHERE u > 0;

SELECT count()
FROM t_sparse
WHERE notEmpty(s);