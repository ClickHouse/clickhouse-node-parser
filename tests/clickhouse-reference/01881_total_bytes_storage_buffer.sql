CREATE TABLE test_buffer_table
(
    `a` Int64
)
ENGINE = Buffer('', '', 1, 1000000, 1000000, 1000000, 1000000, 1000000, 1000000);
SELECT total_bytes FROM system.tables WHERE name = 'test_buffer_table' and database = currentDatabase();
