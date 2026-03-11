SELECT '---normal : contains both projections and parts ---';

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT sum(key)
        FROM normal
        WHERE key > 9999
            AND key < 10010
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT sum(key)
FROM normal
WHERE key > 9999
    AND key < 10010;

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT sum(value) AS v
        FROM agg
        WHERE key > 90
            AND key < 110
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT sum(value) AS v
FROM agg
WHERE key > 90
    AND key < 110;

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT max(i)
        FROM x
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT max(i)
FROM x
SETTINGS
    enable_analyzer = 1,
    max_rows_to_read = 2,
    optimize_use_implicit_projections = 1,
    optimize_use_projection_filtering = 1;

SELECT trimLeft(replaceRegexpAll(`explain`, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas'))
FROM (
        EXPLAIN
        SELECT count()
        FROM x
        WHERE (i >= 3
            AND i <= 6)
            OR i = 7
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%ReadFromRemoteParallelReplicas%')
SETTINGS enable_analyzer = 1;

SELECT count()
FROM x
WHERE (i >= 3
    AND i <= 6)
    OR i = 7;