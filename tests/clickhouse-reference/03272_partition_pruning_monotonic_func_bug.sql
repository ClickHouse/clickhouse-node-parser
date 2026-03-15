SET session_timezone = 'Etc/UTC';
CREATE TABLE tt
(
    `id` Int64,
    `ts` DateTime
)
ENGINE = MergeTree()
ORDER BY dateTrunc('hour', ts)
SETTINGS index_granularity = 8192;
SELECT id FROM tt PREWHERE ts BETWEEN toDateTime(1731506400) AND toDateTime(1731594420);
