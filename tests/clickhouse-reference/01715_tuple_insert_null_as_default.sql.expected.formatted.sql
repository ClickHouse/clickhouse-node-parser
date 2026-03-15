CREATE TABLE test_tuple
(
    value Tuple(UInt8, UInt8)
)
ENGINE = TinyLog;

SET input_format_null_as_default = 1;

SELECT *
FROM test_tuple;

SET input_format_null_as_default = 0;

CREATE TABLE test_tuple_nested_in_array
(
    value Array(Tuple(UInt8, UInt8))
)
ENGINE = TinyLog;

SELECT *
FROM test_tuple_nested_in_array;

CREATE TABLE test_tuple_nested_in_array_nested_in_tuple
(
    value Tuple(UInt8, Array(Tuple(UInt8, UInt8)))
)
ENGINE = TinyLog;

SELECT *
FROM test_tuple_nested_in_array_nested_in_tuple;

CREATE TABLE test_tuple_nested_in_map
(
    value Map(String, Tuple(UInt8, UInt8))
)
ENGINE = TinyLog;

SELECT *
FROM test_tuple_nested_in_map;

CREATE TABLE test_tuple_nested_in_map_nested_in_tuple
(
    value Tuple(UInt8, Map(String, Tuple(UInt8, UInt8)))
)
ENGINE = TinyLog;

SELECT *
FROM test_tuple_nested_in_map_nested_in_tuple;