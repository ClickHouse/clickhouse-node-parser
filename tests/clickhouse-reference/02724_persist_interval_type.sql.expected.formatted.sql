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

SELECT *
FROM t1;