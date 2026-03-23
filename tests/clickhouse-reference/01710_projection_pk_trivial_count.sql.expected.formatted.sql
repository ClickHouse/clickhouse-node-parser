SYSTEM drop  table if exists x;

SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

CREATE TABLE x
(
    i int
)
ENGINE = MergeTree
ORDER BY i
SETTINGS index_granularity = 3;

INSERT INTO x SELECT *
FROM numbers(10);

SELECT trimLeft(*)
FROM (
        EXPLAIN
        SELECT count()
        FROM x
        WHERE (i >= 3
            AND i <= 6)
            OR i = 7
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromMergeTree%');

SELECT count()
FROM x
WHERE (i >= 3
    AND i <= 6)
    OR i = 7;

SYSTEM drop  table x;