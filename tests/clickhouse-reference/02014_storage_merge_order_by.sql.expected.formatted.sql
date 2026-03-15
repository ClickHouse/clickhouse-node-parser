CREATE TABLE short
(
    e Int64,
    t DateTime
)
ENGINE = MergeTree
ORDER BY t
PARTITION BY e;

CREATE TABLE long
(
    e Int64,
    t DateTime
)
ENGINE = MergeTree
ORDER BY t
PARTITION BY (e, toStartOfMonth(t));

CREATE TABLE merged AS short
ENGINE = Merge(currentDatabase(), 'short|long');

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS optimize_read_in_order = 0;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 1;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 3;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 10;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 50;