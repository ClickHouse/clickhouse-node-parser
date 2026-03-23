CREATE DATABASE test_01191
ENGINE = Atomic;

CREATE TABLE test_01191._
(
    n UInt64,
    s String
)
ENGINE = Memory();

CREATE TABLE test_01191.t
(
    n UInt64,
    s String
)
ENGINE = Memory();

CREATE DICTIONARY test_01191.dict
(
    n UInt64,
    s String
)
PRIMARY KEY n
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE '_' DB 'test_01191'))
LAYOUT(DIRECT());

INSERT INTO test_01191._;

SELECT
    name,
    status
FROM `system`.dictionaries
WHERE database = 'test_01191';

SELECT
    name,
    engine
FROM `system`.tables
WHERE database = 'test_01191'
ORDER BY name ASC;

SELECT dictGet(test_01191.t, 's', toUInt64(42));

CREATE DATABASE dummy_db
ENGINE = Atomic;

SELECT dictGet(test_01191.dict1, 's', toUInt64(42));

SELECT dictGet(test_01191.dict2, 's', toUInt64(42));