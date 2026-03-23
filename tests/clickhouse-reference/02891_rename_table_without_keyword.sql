DROP DATABASE IF EXISTS {CLICKHOUSE_DATABASE:Identifier};
CREATE DATABASE IF NOT EXISTS {CLICKHOUSE_DATABASE:Identifier};
CREATE TABLE IF NOT EXISTS {CLICKHOUSE_DATABASE:Identifier}.r1 (name String) Engine=Memory();
CREATE TABLE IF NOT EXISTS {CLICKHOUSE_DATABASE:Identifier}.r2 (name String) Engine=Memory();
CREATE TABLE IF NOT EXISTS {CLICKHOUSE_DATABASE:Identifier}.source_table (
                id UInt64,
                value String
            ) ENGINE = Memory;
CREATE DICTIONARY IF NOT EXISTS {CLICKHOUSE_DATABASE:Identifier}.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE '{CLICKHOUSE_DATABASE:String}.dictionary_table'))
LAYOUT(FLAT())
LIFETIME(MIN 0 MAX 1000);
