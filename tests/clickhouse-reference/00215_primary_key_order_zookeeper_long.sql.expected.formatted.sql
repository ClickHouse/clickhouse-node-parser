SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE primary_key
(
    d Date DEFAULT today(),
    x Int8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00215/primary_key', 'r1', d, negate(x), 1);

SELECT x
FROM primary_key
ORDER BY x ASC;

SELECT x
FROM primary_key
WHERE negate(x) < -1
ORDER BY x ASC;