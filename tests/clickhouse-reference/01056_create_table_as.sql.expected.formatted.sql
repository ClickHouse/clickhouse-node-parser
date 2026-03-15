CREATE TABLE t1
(
    key Int
)
ENGINE = Memory;

CREATE TABLE t2 AS t1;

CREATE TABLE t2 AS t1
ENGINE = Memory;

CREATE TABLE t2 AS t1
ENGINE = Memory;

CREATE TABLE t3 AS numbers(10);

-- view
CREATE VIEW v
AS
SELECT *
FROM t1;

CREATE TABLE t3 AS v; -- { serverError INCORRECT_QUERY }

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier};

CREATE TABLE {CLICKHOUSE_DATABASE_1:Identifier}.dict_data
(
    key Int,
    value UInt16
)
ENGINE = Memory();

CREATE DICTIONARY dict
(
    key UInt64,
    value UInt16
)
PRIMARY KEY key
SOURCE(clickhouse(HOST '127.0.0.1' PORT tcpPort() TABLE 'dict_data' DB concat(currentDatabase(), '_1') USER 'default' PASSWORD ''))
LIFETIME(MIN 0 MAX 0)
LAYOUT(SPARSE_HASHED());

CREATE TABLE t3 AS dict; -- { serverError INCORRECT_QUERY }

CREATE TABLE t1
(
    x String
)
ENGINE = Memory AS
SELECT 1;

SELECT
    x,
    toTypeName(x)
FROM t1;