SET use_structure_from_insertion_table_in_table_functions = 1;

CREATE TABLE test_02249
(
    x UInt32,
    y String
)
ENGINE = Memory();

INSERT INTO test_02249 SELECT *
FROM input();

SELECT *
FROM test_02249;