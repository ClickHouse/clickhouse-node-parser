SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    key Int64,
    someCol String,
    eventTime DateTime
)
ENGINE = ReplacingMergeTree(eventTime)
ORDER BY key;

INSERT INTO t;

SET enable_analyzer = 1;

SYSTEM DROP  TABLE t;