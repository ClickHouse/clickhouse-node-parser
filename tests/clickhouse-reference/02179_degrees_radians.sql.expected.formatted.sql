CREATE TABLE test_degs_to_rads
(
    degrees Float64
)
ENGINE = Memory;

-- test that converting degrees to radians and back preserves the original value
SELECT DEGREES(RADIANS(degrees))
FROM test_degs_to_rads
ORDER BY degrees ASC;

-- test that radians func returns correct value for both int and floats
SELECT RADIANS(degrees)
FROM test_degs_to_rads
ORDER BY degrees ASC;

CREATE TABLE test_rads_to_degs
(
    radians Float64
)
ENGINE = Memory;

-- test that converting radians to degrees and back preserves the original value
SELECT RADIANS(DEGREES(radians))
FROM test_rads_to_degs
ORDER BY radians ASC;

-- test that degrees func returns correct value for both int and floats
SELECT DEGREES(radians)
FROM test_rads_to_degs
ORDER BY radians ASC;