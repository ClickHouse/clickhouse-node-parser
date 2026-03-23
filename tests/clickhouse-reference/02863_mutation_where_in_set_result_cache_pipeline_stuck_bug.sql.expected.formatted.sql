DROP TABLE IF EXISTS tab;

CREATE TABLE tab
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO tab SELECT
    number,
    number
FROM numbers(10);

INSERT INTO tab SELECT
    number,
    number
FROM numbers(20);

SET mutations_sync = 2;