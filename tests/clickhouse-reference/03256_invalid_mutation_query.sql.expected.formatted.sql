DROP TABLE IF EXISTS t;

DROP TABLE IF EXISTS t2;

CREATE TABLE t
(
    x int
)
ENGINE = MergeTree()
ORDER BY tuple();

ALTER TABLE t DELETE WHERE x IN (
    SELECT y
    FROM t
); -- { serverError UNKNOWN_IDENTIFIER }

ALTER TABLE t UPDATE x = 1 WHERE x IN (
    SELECT y
    FROM t
); -- { serverError UNKNOWN_IDENTIFIER }

ALTER TABLE t ADD COLUMN y int;

CREATE TABLE t2
(
    x int
)
ENGINE = MergeTree()
ORDER BY tuple();

DROP TABLE t;

DROP TABLE t2;