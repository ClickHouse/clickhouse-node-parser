CREATE TABLE test_00687
(
    x String
)
ENGINE = Null;

CREATE MATERIALIZED VIEW mv_bad
(
    x String
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY tuple()
AS
SELECT DISTINCT x
FROM test_00687;

CREATE MATERIALIZED VIEW mv_good
(
    x String
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY tuple()
AS
SELECT x
FROM test_00687;

CREATE MATERIALIZED VIEW mv_group
(
    x String
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY tuple()
AS
SELECT x
FROM test_00687
GROUP BY x;

SELECT *
FROM mv_bad;

SELECT '---';

SELECT *
FROM mv_good;

SELECT *
FROM mv_group;