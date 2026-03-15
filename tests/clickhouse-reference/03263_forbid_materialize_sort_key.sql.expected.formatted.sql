CREATE TABLE IF NOT EXISTS test
(
    a UInt64
)
ENGINE = MergeTree()
ORDER BY a;

CREATE TABLE IF NOT EXISTS tab
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE DICTIONARY IF NOT EXISTS dict
(
    x UInt32,
    y UInt32
)
PRIMARY KEY x
SOURCE(clickhouse(table 'tab'))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT());

CREATE TABLE IF NOT EXISTS tab2
(
    x UInt32,
    y UInt32 MATERIALIZED dictGet(dict, 'y', x)
)
ENGINE = MergeTree
ORDER BY (y);

SET mutations_sync = 2;