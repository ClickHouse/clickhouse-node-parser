SET flatten_nested = 1;

SYSTEM drop  table if exists test_nested;

CREATE TABLE test_nested
(
    data Nested(x UInt32, y UInt32)
)
ENGINE = Memory;

SYSTEM drop  table test_nested;

SYSTEM drop  table if exists test_array_tuple;

CREATE TABLE test_array_tuple
(
    data Array(Tuple(x UInt64, y UInt64))
)
ENGINE = Memory;

SYSTEM drop  table test_array_tuple;