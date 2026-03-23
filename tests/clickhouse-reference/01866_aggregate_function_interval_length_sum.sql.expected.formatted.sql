SYSTEM DROP  TABLE IF EXISTS interval;

SYSTEM DROP  TABLE IF EXISTS fl_interval;

SYSTEM DROP  TABLE IF EXISTS dt_interval;

SYSTEM DROP  TABLE IF EXISTS date_interval;

CREATE TABLE `interval`
(
    id String,
    start Int64,
    `end` Int64
)
ENGINE = MergeTree
ORDER BY start;

INSERT INTO `interval`;

CREATE TABLE fl_interval
(
    id String,
    start Float,
    `end` Float
)
ENGINE = MergeTree
ORDER BY start;

INSERT INTO fl_interval;

CREATE TABLE dt_interval
(
    id String,
    start DateTime,
    `end` DateTime
)
ENGINE = MergeTree
ORDER BY start;

INSERT INTO dt_interval;

CREATE TABLE date_interval
(
    id String,
    start Date,
    `end` Date
)
ENGINE = MergeTree
ORDER BY start;

INSERT INTO date_interval;

SELECT
    id,
    intervalLengthSum(start, `end`),
    toTypeName(intervalLengthSum(start, `end`))
FROM `interval`
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    3.4 < intervalLengthSum(start, `end`)
    AND intervalLengthSum(start, `end`) < 3.6,
    toTypeName(intervalLengthSum(start, `end`))
FROM fl_interval
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    intervalLengthSum(start, `end`),
    toTypeName(intervalLengthSum(start, `end`))
FROM dt_interval
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    intervalLengthSum(start, `end`),
    toTypeName(intervalLengthSum(start, `end`))
FROM date_interval
GROUP BY id
ORDER BY id ASC;

SYSTEM DROP  TABLE interval;

SYSTEM DROP  TABLE fl_interval;

SYSTEM DROP  TABLE dt_interval;

SYSTEM DROP  TABLE date_interval;