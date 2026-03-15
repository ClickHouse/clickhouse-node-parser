CREATE TABLE test
(
    v Variant(Array(Nullable(String)))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT v.`Array(Nullable(String))`.`null`
FROM test;