CREATE TABLE lc_test
(
    id LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY tuple();

SELECT id
FROM lc_test;