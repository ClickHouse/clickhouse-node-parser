SYSTEM drop  table if exists ay;

CREATE TABLE ay
ENGINE = AggregatingMergeTree
ORDER BY i AS
SELECT
    1 AS i,
    sumSimpleState(10)
GROUP BY i;

INSERT INTO ay;

INSERT INTO ay;

INSERT INTO ay;

SELECT *
FROM ay;

INSERT INTO ay;