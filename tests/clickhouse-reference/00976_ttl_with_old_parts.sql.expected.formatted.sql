CREATE TABLE ttl
(
    d Date,
    a Int
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY toDayOfMonth(d)
SETTINGS remove_empty_parts = 0;

INSERT INTO ttl;

INSERT INTO ttl;

INSERT INTO ttl;

INSERT INTO ttl;

SELECT sleep(1)
FORMAT Null; -- wait if very fast merge happen

SELECT *
FROM ttl
ORDER BY
    d ASC,
    a ASC;