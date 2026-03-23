SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_table;

SYSTEM DROP  TABLE IF EXISTS special_set_table;

CREATE TABLE special_set_table
(
    id UInt64
)
ENGINE = Set;

INSERT INTO special_set_table;

SELECT
    id,
    value
FROM test_table
WHERE id IN (special_set_table);

SYSTEM DROP  TABLE special_set_table;

SYSTEM DROP  TABLE test_table;