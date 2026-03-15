CREATE TABLE test
(
    x Nullable(UInt32),
    y UInt32
)
ENGINE = Memory();

SET use_structure_from_insertion_table_in_table_functions = 2;

SET input_format_json_infer_incomplete_types_as_strings = 0;

SELECT *
FROM test
ORDER BY y ASC;

CREATE TABLE test
(
    x Nullable(UInt32)
)
ENGINE = Memory();

SELECT *
FROM test
ORDER BY x ASC;