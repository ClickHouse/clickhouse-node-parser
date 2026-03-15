CREATE TABLE test_table
(
    key UInt32,
    A UInt32,
    B String
)
ENGINE = SummingMergeTree()
ORDER BY key;

SELECT count()
FROM test_table;

CREATE TABLE test_table
(
    key UInt32,
    A UInt32,
    B String
)
ENGINE = CoalescingMergeTree()
ORDER BY key;

CREATE TABLE test_table
(
    key UInt32,
    A Nullable(UInt32),
    B Nullable(String)
)
ENGINE = CoalescingMergeTree()
ORDER BY key;

SELECT *
FROM test_table FINAL
ORDER BY `ALL` ASC;

CREATE TABLE test_table
(
    key UInt32,
    value Nullable(UInt32)
)
ENGINE = CoalescingMergeTree()
ORDER BY key;

SELECT *
FROM test_table FINAL;

SELECT ' -- AggregatingMergeTree --\n'
FORMAT TSVRaw;

CREATE TABLE test_table
(
    key UInt32,
    A SimpleAggregateFunction(anyLast, Nullable(Int64)),
    B SimpleAggregateFunction(anyLast, Nullable(DateTime)),
    C SimpleAggregateFunction(anyLast, Nullable(String))
)
ENGINE = AggregatingMergeTree()
ORDER BY key;

SELECT '\n\n -- CoalescingMergeTree --\n'
FORMAT TSVRaw;

CREATE TABLE test_table
(
    key UInt32,
    A Nullable(Int64),
    B Nullable(DateTime),
    C Nullable(String)
)
ENGINE = CoalescingMergeTree()
ORDER BY key;

CREATE TABLE electric_vehicle_state
(
    vin String,
    last_update DateTime64 MATERIALIZED now64(),
    battery_level Nullable(UInt8),
    lat Nullable(Float64),
    lon Nullable(Float64),
    firmware_version Nullable(String),
    cabin_temperature Nullable(Float32),
    speed_kmh Nullable(Float32)
)
ENGINE = CoalescingMergeTree
ORDER BY vin;

SELECT
    vin,
    battery_level AS batt,
    lat AS lat,
    lon AS lon,
    firmware_version AS fw,
    cabin_temperature AS temp,
    speed_kmh AS speed
FROM electric_vehicle_state FINAL
ORDER BY vin ASC;

CREATE TABLE test_table
(
    key UInt32,
    value Nullable(UInt32),
    value_arr Variant(Array(UInt32), Nothing)
)
ENGINE = CoalescingMergeTree()
ORDER BY key;