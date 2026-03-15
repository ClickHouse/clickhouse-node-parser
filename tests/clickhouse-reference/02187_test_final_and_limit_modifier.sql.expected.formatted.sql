CREATE TABLE test_02187
(
    info String,
    id Int32
)
ENGINE = ReplacingMergeTree(id)
ORDER BY id;

SELECT *
FROM test_02187 FINAL;

SELECT *
FROM test_02187 FINAL
LIMIT 1;