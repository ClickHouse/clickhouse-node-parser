CREATE TABLE nums
(
    n UInt32
)
ENGINE = Memory;

SELECT quantilesExactExclusive(0.1, 0.9)(n)
FROM nums;

SELECT quantilesExactInclusive(0, 1)(n)
FROM nums;