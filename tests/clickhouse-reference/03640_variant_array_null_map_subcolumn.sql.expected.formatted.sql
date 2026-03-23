CREATE TABLE test
(
    v Variant(Array(Nullable(String)))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test SELECT ['hello', null, 'world'];

SELECT v.`Array(Nullable(String))`.`null`
FROM test;