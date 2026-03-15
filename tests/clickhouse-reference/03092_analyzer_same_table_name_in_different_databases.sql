-- https://github.com/ClickHouse/ClickHouse/issues/61947
SET enable_analyzer=1;
CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier};
CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier};
CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.`1-1` (field Int8) ENGINE = Memory;
CREATE TABLE {CLICKHOUSE_DATABASE_1:Identifier}.`2-1` (field Int8) ENGINE = Memory;
CREATE TABLE {CLICKHOUSE_DATABASE_1:Identifier}.`3-1` (field Int8) ENGINE = Memory;
SELECT {CLICKHOUSE_DATABASE:Identifier}.`1-1`.*
FROM {CLICKHOUSE_DATABASE:Identifier}.`1-1`
LEFT JOIN {CLICKHOUSE_DATABASE_1:Identifier}.`2-1` ON {CLICKHOUSE_DATABASE:Identifier}.`1-1`.field = {CLICKHOUSE_DATABASE_1:Identifier}.`2-1`.field
LEFT JOIN {CLICKHOUSE_DATABASE_1:Identifier}.`3-1` ON {CLICKHOUSE_DATABASE_1:Identifier}.`2-1`.field = {CLICKHOUSE_DATABASE_1:Identifier}.`3-1`.field;
