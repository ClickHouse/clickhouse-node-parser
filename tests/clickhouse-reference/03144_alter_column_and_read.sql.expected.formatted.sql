SYSTEM drop  table if exists tab;

CREATE TABLE tab
(
    x UInt32
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tab SELECT number
FROM numbers(10);

SET alter_sync = 0;

SELECT
    x,
    y
FROM tab
ORDER BY x ASC;