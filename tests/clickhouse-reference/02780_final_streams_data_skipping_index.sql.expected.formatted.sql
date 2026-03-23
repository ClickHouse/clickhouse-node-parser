-- Tags: no-random-merge-tree-settings, no-random-settings
SYSTEM DROP  TABLE IF EXISTS data;

CREATE TABLE data
(
    key Int,
    v1 DateTime,
    INDEX v1_index v1 TYPE minmax GRANULARITY 1
)
ENGINE = AggregatingMergeTree()
ORDER BY key
SETTINGS index_granularity = 8192, min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0;

SET optimize_on_insert = 0;

-- generate 50% of marks that cannot be skipped with v1_index
-- this will create a gap in marks
INSERT INTO data SELECT
    number,
    if(number / 8192 % 2 == 0, now(), now() - toIntervalDay(200))
FROM numbers(1e6);

INSERT INTO data SELECT
    number + 1e6,
    if(number / 8192 % 2 == 0, now(), now() - toIntervalDay(200))
FROM numbers(1e6);