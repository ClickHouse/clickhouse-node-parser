CREATE TABLE table_map
(
    a Map(String, String)
)
ENGINE = Memory;

SELECT a['name']
FROM table_map;

CREATE TABLE table_map
(
    a Map(String, UInt64)
)
ENGINE = MergeTree()
ORDER BY a
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    a['key1'],
    a['key2']
FROM table_map;

CREATE TABLE table_map
(
    a Map(String, String),
    b String
)
ENGINE = MergeTree()
ORDER BY a
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT a[b]
FROM table_map;

SELECT b
FROM table_map
WHERE a = map('name', 'lisi', 'gender', 'female');

-- Big Integer type
CREATE TABLE table_map
(
    d DATE,
    m Map(Int8, UInt256)
)
ENGINE = MergeTree()
ORDER BY d
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT *
FROM table_map;

-- Integer type
CREATE TABLE table_map
(
    d DATE,
    m Map(Int8, Int8)
)
ENGINE = MergeTree()
ORDER BY d
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE table_map
(
    a Map(UInt8, UInt64),
    b UInt8
)
ENGINE = MergeTree()
ORDER BY b
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE table_map
(
    a Map(String, Array(UInt8))
)
ENGINE = MergeTree()
ORDER BY a
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT a['k1'] AS col1
FROM table_map
ORDER BY col1 ASC;

SELECT
    CAST(([1, 2, 3], ['1', '2', 'foo']), 'Map(UInt8, String)') AS map,
    map[1];

CREATE TABLE table_map
(
    n UInt32,
    m Map(String, Int)
)
ENGINE = MergeTree
ORDER BY n
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    sum(m['1']),
    sum(m['7']),
    sum(m['100'])
FROM table_map;

CREATE TABLE table_map
(
    n UInt32,
    m Map(String, Int)
)
ENGINE = MergeTree
ORDER BY n
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    CAST(([2, 1, 1023], ['', '']), 'Map(UInt8, String)') AS map,
    map[10]; -- { serverError TYPE_MISMATCH}