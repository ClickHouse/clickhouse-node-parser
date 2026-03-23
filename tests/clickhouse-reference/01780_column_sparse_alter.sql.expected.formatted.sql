SET mutations_sync = 2;

CREATE TABLE t_sparse_alter
(
    id UInt64,
    u UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.5;

INSERT INTO t_sparse_alter SELECT
    number,
    if(number % 11 = 0, number, 0),
    if(number % 13 = 0, toString(number), '')
FROM numbers(2000);

SELECT
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_alter'
    AND active
ORDER BY column ASC;

SELECT
    uniqExact(u),
    uniqExact(s)
FROM t_sparse_alter;

SELECT uniqExact(t)
FROM t_sparse_alter;