-- Check that table size is less than 100K
SELECT
    engine_full,
    total_rows,
    total_bytes < 100000
FROM initial_table_size;

-- Check that table size is less than 2x after inserting one row
SELECT
    engine_full,
    total_rows,
    total_bytes < 2 * (
        SELECT total_bytes
        FROM initial_table_size
    )
FROM one_row_table_size;

-- Check that rows with the same key are not duplicated
SELECT
    engine_full,
    total_rows,
    total_bytes == (
        SELECT total_bytes
        FROM one_row_table_size
    )
FROM `system`.tables
WHERE (name = 'join_test')
    AND (database = currentDatabase());

SELECT count() == 3
FROM
    (
        SELECT 1 AS key
    ) AS t1
RIGHT JOIN join_test_right
    ON t1.key = join_test_right.key;

SELECT count() == 10
FROM
    (
        SELECT 1 AS key
    ) AS t1
RIGHT JOIN join_test_right
    ON t1.key = join_test_right.key;

SELECT count() == 10
FROM
    (
        SELECT 2 AS key
    ) AS t1
RIGHT JOIN join_test_right
    ON t1.key = join_test_right.key;