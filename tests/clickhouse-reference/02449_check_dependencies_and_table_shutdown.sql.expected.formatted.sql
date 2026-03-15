CREATE TABLE view
(
    id UInt32,
    value String
)
ENGINE = ReplicatedMergeTree('/test/2449/{database}', '1')
ORDER BY id;

CREATE DICTIONARY dict
(
    id UInt32,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(host 'localhost' port tcpPort() user 'default' db currentDatabase() table 'view'))
LIFETIME(MIN 600 MAX 600)
LAYOUT(HASHED());

CREATE TABLE table
(
    col MATERIALIZED dictGet(concat(currentDatabase(), '.dict'), 'value', toUInt32(1)),
    phys Int
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM dictionary('dict');

SELECT *
FROM dictionary('dict')
ORDER BY id ASC;