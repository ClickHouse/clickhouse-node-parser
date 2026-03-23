CREATE TABLE view
(
    id UInt32,
    value String
)
ENGINE = ReplicatedMergeTree('/test/2449/{database}', '1')
ORDER BY id;

INSERT INTO view;

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

-- check that table is not readonly
INSERT INTO view;

SELECT *
FROM dictionary('dict')
ORDER BY id ASC;