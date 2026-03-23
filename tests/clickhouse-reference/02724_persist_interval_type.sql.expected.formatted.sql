CREATE TABLE saved_intervals_tmp
ENGINE = Memory AS
SELECT
    number AS EventID,
    toIntervalSecond(number + 1) AS v1,
    toIntervalHour(number + 2) AS v2,
    toIntervalNanosecond(number + 3) AS v3
FROM numbers(2);

CREATE TABLE saved_intervals_mgt
ENGINE = MergeTree()
ORDER BY EventID AS
SELECT
    number AS EventID,
    toIntervalSecond(number + 1) AS v1,
    toIntervalHour(number + 2) AS v2,
    toIntervalNanosecond(number + 3) AS v3
FROM numbers(2);

CREATE TABLE t1
(
    v1 IntervalMinute
)
ENGINE = Memory;

INSERT INTO t1 WITH toDateTime64('2023-01-01 00:00:00.000000001', 9, 'US/Eastern') AS c

SELECT toMinute(c + toIntervalSecond(number * 60))
FROM numbers(2);

SELECT *
FROM t1;