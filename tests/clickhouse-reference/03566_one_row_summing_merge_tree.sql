CREATE TABLE test_table
(
    key UInt32,
    A UInt32,
    B String
)
ENGINE = SummingMergeTree()
ORDER BY key;
SELECT count() FROM test_table;
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
SELECT * FROM test_table FINAL ORDER BY ALL;
CREATE TABLE test_table
(
    key UInt32,
    value Nullable(UInt32)
)
ENGINE = CoalescingMergeTree()
ORDER BY key;
select * from test_table final;
select ' -- AggregatingMergeTree --\n' format TSVRaw;
CREATE TABLE test_table
(
    key UInt32,
    A SimpleAggregateFunction(anyLast,Nullable(Int64)),  
    B SimpleAggregateFunction(anyLast,Nullable(DateTime)),
    C SimpleAggregateFunction(anyLast,Nullable(String))
)
ENGINE = AggregatingMergeTree()
ORDER BY key;
select '\n\n -- CoalescingMergeTree --\n' format TSVRaw;
CREATE TABLE test_table
(
    key UInt32,
    A Nullable(Int64),  
    B Nullable(DateTime),
    C Nullable(String),
)
ENGINE = CoalescingMergeTree()
ORDER BY key;
CREATE TABLE electric_vehicle_state
(
    vin String, -- vehicle identification number
    last_update DateTime64 Materialized now64(), -- optional (used with argMax)
    battery_level Nullable(UInt8), -- in %
    lat Nullable(Float64), -- latitude (°)
    lon Nullable(Float64), -- longitude (°)
    firmware_version Nullable(String),
    cabin_temperature Nullable(Float32), -- in °C
    speed_kmh Nullable(Float32) -- from sensor
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
ORDER BY vin;
CREATE TABLE test_table
(
    key UInt32,
    value Nullable(UInt32),
    value_arr Variant(Array(UInt32), Nothing)
)
ENGINE = CoalescingMergeTree()
ORDER BY key;
