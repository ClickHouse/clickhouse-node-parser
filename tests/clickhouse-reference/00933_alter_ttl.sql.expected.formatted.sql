SET send_logs_level = 'fatal';

SYSTEM drop  table if exists ttl;

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

SELECT *
FROM ttl
ORDER BY
    d ASC,
    a ASC;

CREATE TABLE ttl
(
    d Date,
    a Int
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toDayOfMonth(d)
SETTINGS remove_empty_parts = 0;