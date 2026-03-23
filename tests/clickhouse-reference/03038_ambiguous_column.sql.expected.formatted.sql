-- https://github.com/ClickHouse/ClickHouse/issues/48308
SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS 03038_table;

CREATE TABLE `03038_table`
(
    time DateTime
)
ENGINE = MergeTree
ORDER BY time;

SELECT *
FROM (
        SELECT
            toUInt64(time) AS time,
            toHour(`03038_table`.time)
        FROM `03038_table`
    )
ORDER BY time ASC;

SELECT *
FROM (
        SELECT
            toUInt64(time) AS time,
            toHour(`03038_table`.time) AS hour
        FROM `03038_table`
    )
ORDER BY
    time ASC,
    hour ASC;