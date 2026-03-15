set flatten_nested = 1;
create table test_nested (data Nested(x UInt32, y UInt32)) engine=Memory;
create table test_array_tuple (data Array(Tuple(x UInt64, y UInt64))) engine=Memory;
