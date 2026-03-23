-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS partslost_0;

SYSTEM DROP  TABLE IF EXISTS partslost_1;

SYSTEM DROP  TABLE IF EXISTS partslost_2;

CREATE TABLE partslost_0
(
    x String
)
ENGINE = ReplicatedMergeTree('/clickhouse/table/{database}_02067_lost/partslost', '0')
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, old_parts_lifetime = 1, cleanup_delay_period = 1, cleanup_delay_period_random_add = 1, cleanup_thread_preferred_points_per_iteration = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE partslost_1
(
    x String
)
ENGINE = ReplicatedMergeTree('/clickhouse/table/{database}_02067_lost/partslost', '1')
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, old_parts_lifetime = 1, cleanup_delay_period = 1, cleanup_delay_period_random_add = 1, cleanup_thread_preferred_points_per_iteration = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE partslost_2
(
    x String
)
ENGINE = ReplicatedMergeTree('/clickhouse/table/{database}_02067_lost/partslost', '2')
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, old_parts_lifetime = 1, cleanup_delay_period = 1, cleanup_delay_period_random_add = 1, cleanup_thread_preferred_points_per_iteration = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO partslost_0 SELECT toString(number) AS x
FROM `system`.numbers
LIMIT 10000;

SET mutations_sync = 2;

-- In worst case doesn't check anything, but it's not flaky
SELECT sleep(3)
FORMAT Null;

SELECT count()
FROM partslost_0;

SELECT count()
FROM partslost_1;

SELECT count()
FROM partslost_2;