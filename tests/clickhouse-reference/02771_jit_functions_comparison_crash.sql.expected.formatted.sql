SET compile_expressions = 1;

SET min_count_to_compile_expression = 0;

DROP TABLE IF EXISTS test_table_1;

CREATE TABLE test_table_1
(
    pkey UInt32,
    c8 UInt32,
    c9 String,
    c10 Float32,
    c11 String
)
ENGINE = MergeTree
ORDER BY pkey;

DROP TABLE IF EXISTS test_table_2;

CREATE TABLE test_table_2
(
    vkey UInt32,
    pkey UInt32,
    c15 UInt32
)
ENGINE = MergeTree
ORDER BY vkey;

DROP TABLE test_table_1;

DROP TABLE test_table_2;