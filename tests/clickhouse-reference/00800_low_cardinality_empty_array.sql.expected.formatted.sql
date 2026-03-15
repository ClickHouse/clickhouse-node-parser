CREATE TABLE lc_00800_1
(
    names Array(LowCardinality(String))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM lc_00800_1;