SET mutations_sync = 2;

CREATE TABLE t_sparse_mutations_1
(
    key UInt8,
    id UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY key
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;

SELECT
    name,
    type,
    serialization_kind
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 't_sparse_mutations_1'
    AND column = 's'
    AND active
ORDER BY name ASC;

SELECT
    countIf(s = 'foo'),
    arraySort(groupUniqArray(s))
FROM t_sparse_mutations_1;