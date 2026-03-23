CREATE TABLE t0
(
    key Int32,
    value Int32
)
ENGINE = MergeTree()
PRIMARY KEY key
PARTITION BY key % 2;

INSERT INTO t0;

CREATE DICTIONARY d0
(
    key Int32,
    value Int32
)
PRIMARY KEY key
SOURCE(clickhouse(DATABASE default TABLE t0))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED());

SELECT *
FROM d0;