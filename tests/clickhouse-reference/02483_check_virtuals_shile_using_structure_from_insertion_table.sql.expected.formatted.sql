CREATE TABLE test
(
    line String,
    _file String,
    _path String
)
ENGINE = Memory;

SET use_structure_from_insertion_table_in_table_functions = 2;

SELECT
    line,
    _file
FROM test;