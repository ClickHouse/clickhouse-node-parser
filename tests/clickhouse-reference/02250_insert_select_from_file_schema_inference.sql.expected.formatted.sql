SET use_structure_from_insertion_table_in_table_functions = 1;

CREATE TABLE test_02250
(
    x Nullable(UInt32)
)
ENGINE = Memory();

SELECT *
FROM test_02250;