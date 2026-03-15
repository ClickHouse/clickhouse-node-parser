CREATE TABLE cardinality
(
    x String
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM cardinality;