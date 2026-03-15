CREATE TABLE ttl
(
    d Date,
    a Int
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY toDayOfMonth(d)
TTL d + toIntervalDay(1);

SELECT sleep(1)
FORMAT Null; -- wait if very fast merge happen

SELECT *
FROM ttl
ORDER BY
    d ASC,
    a ASC;