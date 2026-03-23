CREATE DATABASE test_db_2025;

CREATE TABLE test_db_2025.test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_db_2025.test_table;

CREATE DICTIONARY test_db_2025.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_table' DB 'test_db_2025'))
LAYOUT(DIRECT());

CREATE TABLE test_db_2025.view_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_db_2025.view_table;

CREATE VIEW test_view_different_db
AS
SELECT
    id,
    value,
    dictGet('test_db_2025.test_dictionary', 'value', id)
FROM test_db_2025.view_table;

SELECT *
FROM test_view_different_db;