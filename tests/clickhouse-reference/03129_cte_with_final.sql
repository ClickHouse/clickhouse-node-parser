CREATE TABLE t
(
    `key` Int64,
    `someCol` String,
    `eventTime` DateTime
)
ENGINE = ReplacingMergeTree(eventTime)
ORDER BY key;
INSERT INTO t Values (1, 'first', '2024-04-19 01:01:01');
SET enable_analyzer = 1;
