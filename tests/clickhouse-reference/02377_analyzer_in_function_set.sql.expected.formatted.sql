SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

CREATE TABLE special_set_table
(
    id UInt64
)
ENGINE = Set;

SELECT
    id,
    value
FROM test_table
WHERE id IN (special_set_table);