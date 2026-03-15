SET mutations_sync = 2;

CREATE TABLE t_delete_skip_index
(
    x UInt32,
    y String,
    INDEX i y TYPE minmax GRANULARITY 3
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT count()
FROM t_delete_skip_index
WHERE y IN (4, 5);

CREATE TABLE t_delete_projection
(
    x UInt32,
    y UInt64,
    PROJECTION p (    SELECT sum(y))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT sum(y)
FROM t_delete_projection
SETTINGS optimize_use_projections = 0;

SELECT sum(y)
FROM t_delete_projection
SETTINGS
    optimize_use_projections = 0,
    force_optimize_projection = 1;