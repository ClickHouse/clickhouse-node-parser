CREATE TABLE ay
ENGINE = AggregatingMergeTree
ORDER BY i AS
SELECT
    1 AS i,
    sumSimpleState(10)
GROUP BY i;

SELECT *
FROM ay;