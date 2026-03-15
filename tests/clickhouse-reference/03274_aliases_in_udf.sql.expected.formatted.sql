-- Tags: no-parallel
SET enable_analyzer = 1;

SET skip_redundant_aliases_in_udf = 0;

CREATE FUNCTION `03274_test_function` AS input_column_name -> ((
        '1' AS a,
        input_column_name AS input_column_name
    ).2);

CREATE TABLE IF NOT EXISTS test_table
(
    metadata_a String,
    metadata_b String
)
ENGINE = MergeTree()
ORDER BY tuple();

SET skip_redundant_aliases_in_udf = 1;

SELECT mat_a
FROM test_table;

SELECT mat_b
FROM test_table;

CREATE FUNCTION test_03274 AS x -> ((x + 1 as y, y + 2));