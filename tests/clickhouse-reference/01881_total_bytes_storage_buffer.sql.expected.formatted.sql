DROP TABLE IF EXISTS test_buffer_table;

CREATE TABLE test_buffer_table
(
    a Int64
)
ENGINE = Buffer('', '', 1, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000);

SELECT total_bytes
FROM `system`.tables
WHERE name = 'test_buffer_table'
    AND database = currentDatabase();

INSERT INTO test_buffer_table SELECT number
FROM numbers(1000);

OPTIMIZE TABLE test_buffer_table;

DROP TABLE test_buffer_table;