CREATE TABLE qbit
(
    id UInt32,
    vec QBit(BFloat16, 3)
)
ENGINE = Memory;

INSERT INTO qbit;

INSERT INTO qbit;

INSERT INTO qbit;

CREATE TABLE qbit
(
    id UInt32,
    vec QBit(Float32, 3)
)
ENGINE = Memory;

CREATE TABLE qbit
(
    id UInt32,
    vec QBit(Float64, 3)
)
ENGINE = Memory;

INSERT INTO qbit SELECT
    number + 1 AS id,
    arrayMap(i -> i + number, range(3)) AS vec
FROM numbers(3);

-- Check that constant FixedString columns are supported
SELECT round(L2DistanceTransposed(''::FixedString(1), 3, [1,2,3]::Array(Float32)), 5); -- useDefaultImplementationForConstants is triggered

SELECT round(L2DistanceTransposed(''::FixedString(1), 3, materialize([1,2,3])::Array(Float32)), 5);