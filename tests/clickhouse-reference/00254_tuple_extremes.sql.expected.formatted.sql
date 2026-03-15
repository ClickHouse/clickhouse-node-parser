CREATE TABLE numbers_10
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

SELECT
    number,
    (number, toDate('2015-01-01') + number)
FROM numbers_10
LIMIT 10
SETTINGS extremes = 1;