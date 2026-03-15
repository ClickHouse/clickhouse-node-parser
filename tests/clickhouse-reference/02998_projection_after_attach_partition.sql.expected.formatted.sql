CREATE TABLE visits_order
(
    user_id UInt64,
    user_name String,
    some_int UInt64
)
ENGINE = MergeTree()
PRIMARY KEY user_id
PARTITION BY user_id
SETTINGS index_granularity = 1;

CREATE TABLE visits_order_dst
(
    user_id UInt64,
    user_name String,
    some_int UInt64
)
ENGINE = MergeTree()
PRIMARY KEY user_id
PARTITION BY user_id
SETTINGS index_granularity = 1;

SET enable_analyzer = 0;

SET enable_analyzer = 1, enable_parallel_replicas = 0;

SET enable_analyzer = 1, enable_parallel_replicas = 1, parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

SELECT trimLeft(*)
FROM (
        EXPLAIN
        SELECT *
        FROM visits_order_dst
        WHERE user_name = 'another_user2'
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromMergeTree%');