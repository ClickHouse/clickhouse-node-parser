CREATE TABLE index
(
    d Date
)
ENGINE = MergeTree
ORDER BY d;

SELECT *
FROM index
WHERE d > toDateTime('2020-04-06 23:59:59');

SELECT *
FROM index
WHERE identity(d > toDateTime('2020-04-06 23:59:59'));