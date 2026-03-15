SET allow_experimental_dynamic_type = 1;

CREATE TABLE test_max_types
(
    d Dynamic(max_types = 5)
)
ENGINE = Memory;

SELECT
    d,
    dynamicType(d)
FROM test_max_types;

CREATE TABLE test_nested_dynamic
(
    d1 Dynamic,
    d2 Dynamic(max_types = 2)
)
ENGINE = Memory;

SELECT
    d1,
    dynamicType(d1),
    d2,
    dynamicType(d2)
FROM test_nested_dynamic;

CREATE TABLE test_rapid_schema
(
    d Dynamic
)
ENGINE = Memory;

SELECT
    d,
    dynamicType(d),
    d.Int64,
    d.String,
    d.Date,
    d.Float64,
    d.DateTime,
    d.`Array(Int64)`,
    d.`Array(String)`
FROM test_rapid_schema
FORMAT PrettyCompactMonoBlock;

SELECT finalizeAggregation(CAST(dynamic_state, 'AggregateFunction(sum, UInt64)'))
FROM (
        SELECT CAST(state, 'Dynamic') AS dynamic_state
        FROM (
                SELECT sumState(number) AS state
                FROM numbers(10000)
            )
    );