SET optimize_throw_if_noop = 1;

-- basic test
SYSTEM drop  table if exists simple;

CREATE TABLE simple
(
    id UInt64,
    val SimpleAggregateFunction(sum, Double)
)
ENGINE = AggregatingMergeTree
ORDER BY id;

INSERT INTO simple SELECT
    number,
    number
FROM `system`.numbers
LIMIT 10;

SELECT *
FROM simple;

SELECT *
FROM simple FINAL
ORDER BY id ASC;

SELECT toTypeName(val)
FROM simple
LIMIT 1;

CREATE TABLE simple
(
    id UInt64,
    nullable_str SimpleAggregateFunction(anyLast, Nullable(String)),
    nullable_str_respect_nulls SimpleAggregateFunction(anyLastRespectNulls, Nullable(String)),
    low_str SimpleAggregateFunction(anyLast, LowCardinality(Nullable(String))),
    ip SimpleAggregateFunction(anyLast, IPv4),
    status SimpleAggregateFunction(groupBitOr, UInt32),
    tup SimpleAggregateFunction(sumMap, Tuple(Array(Int32), Array(Int64))),
    tup_min SimpleAggregateFunction(minMap, Tuple(Array(Int32), Array(Int64))),
    tup_max SimpleAggregateFunction(maxMap, Tuple(Array(Int32), Array(Int64))),
    arr SimpleAggregateFunction(groupArrayArray, Array(Int32)),
    uniq_arr SimpleAggregateFunction(groupUniqArrayArray, Array(Int32)),
    map_uniq_arr SimpleAggregateFunction(groupUniqArrayArrayMap, Map(Int32, Array(Int64)))
)
ENGINE = AggregatingMergeTree
ORDER BY id;

INSERT INTO simple;

INSERT INTO simple;

-- String longer then MAX_SMALL_STRING_SIZE (actual string length is 100)
INSERT INTO simple;

INSERT INTO simple;

SELECT
    toTypeName(nullable_str),
    toTypeName(nullable_str_respect_nulls),
    toTypeName(low_str),
    toTypeName(ip),
    toTypeName(status),
    toTypeName(tup),
    toTypeName(tup_min),
    toTypeName(tup_max),
    toTypeName(arr),
    toTypeName(uniq_arr),
    toTypeName(map_uniq_arr)
FROM simple
LIMIT 1;

SYSTEM drop  table simple;

SYSTEM drop  table if exists with_overflow;

CREATE TABLE with_overflow
(
    id UInt64,
    s SimpleAggregateFunction(sumWithOverflow, UInt8)
)
ENGINE = AggregatingMergeTree
ORDER BY id;

INSERT INTO with_overflow SELECT
    1,
    1
FROM numbers(256);

SELECT
    'with_overflow',
    *
FROM with_overflow;

SYSTEM drop  table with_overflow;