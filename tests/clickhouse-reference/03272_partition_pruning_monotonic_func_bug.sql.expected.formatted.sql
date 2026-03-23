SET session_timezone = 'Etc/UTC';

SYSTEM DROP  TABLE IF EXISTS tt;

CREATE TABLE tt
(
    id Int64,
    ts DateTime
)
ENGINE = MergeTree()
ORDER BY dateTrunc('hour', ts)
SETTINGS index_granularity = 8192;

INSERT INTO tt;

SELECT id
FROM tt
PREWHERE and(greaterOrEquals(ts, toDateTime(1731506400)), lessOrEquals(ts, toDateTime(1731594420)));

SYSTEM DROP  TABLE tt;