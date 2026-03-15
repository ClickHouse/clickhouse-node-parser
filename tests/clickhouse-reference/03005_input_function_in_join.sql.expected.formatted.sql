CREATE TABLE test
(
    a Int8
)
ENGINE = MergeTree
ORDER BY tuple();