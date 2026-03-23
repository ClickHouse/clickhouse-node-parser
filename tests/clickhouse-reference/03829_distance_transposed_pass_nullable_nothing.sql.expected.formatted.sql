CREATE TABLE qbit_test
(
    id UInt64,
    vec QBit(Float32, 18)
)
ENGINE = Memory;

INSERT INTO qbit_test;

SELECT L2DistanceTransposed(vec, NULL, 32)
FROM qbit_test;