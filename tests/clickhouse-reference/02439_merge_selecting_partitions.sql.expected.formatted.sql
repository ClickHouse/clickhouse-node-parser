-- Tags: no-shared-merge-tree
-- Predicate works in a different way
SYSTEM drop  table if exists rmt;

CREATE TABLE rmt
(
    n int,
    m int
)
ENGINE = ReplicatedMergeTree('/test/02439/{shard}/{database}', '{replica}')
ORDER BY n
PARTITION BY n;

INSERT INTO rmt SELECT
    number,
    number
FROM numbers(50);

INSERT INTO rmt;

INSERT INTO rmt;

INSERT INTO rmt;

INSERT INTO rmt;

INSERT INTO rmt;

INSERT INTO rmt;

INSERT INTO rmt;

INSERT INTO rmt;

SET optimize_throw_if_noop = 1;

SELECT sleepEachRow(3) AS higher_probability_of_reproducing_the_issue
FORMAT Null;

-- it should not list unneeded partitions where we cannot merge anything
SELECT *
FROM `system`.zookeeper_log
WHERE like(path, concat('/test/02439/', getMacro('shard'), '/', currentDatabase(), '/block_numbers/%'))
    AND op_num IN ('List', 'SimpleList', 'FilteredList')
    AND notLike(path, '%/block_numbers/1')
    AND notLike(path, '%/block_numbers/123')
    AND event_time >= now() - toIntervalMinute(1)
    -- avoid race with tests like 02311_system_zookeeper_insert
    AND ((isNull(query_id)
    OR query_id = ''
    OR query_id IN (
        SELECT query_id
        FROM `system`.query_log
        WHERE event_time >= now() - toIntervalMinute(1)
            AND current_database = currentDatabase()
    )));

SYSTEM drop  table rmt;