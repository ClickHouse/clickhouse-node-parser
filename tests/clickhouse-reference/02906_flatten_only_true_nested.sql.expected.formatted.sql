SET flatten_nested = 1;

CREATE TABLE test_nested
(
    data Nested(x UInt32, y UInt32)
)
ENGINE = Memory;

CREATE TABLE test_array_tuple
(
    data Array(Tuple(x UInt64, y UInt64))
)
ENGINE = Memory;