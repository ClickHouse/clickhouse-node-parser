CREATE TABLE broken
(
    time UInt64
)
ENGINE = MergeTree
ORDER BY time
PARTITION BY toYYYYMMDD(toDate(time / 1000));

SELECT *
FROM broken
WHERE time > -1;