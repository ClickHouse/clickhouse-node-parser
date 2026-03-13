-- This query with constant PREWHERE (18 is a non-zero integer, treated as true)
-- used to cause "Can't adjust last granule" exception.
-- Just verify it doesn't crash and returns the correct count.
SELECT count()
FROM t_prewhere_const_patches
PREWHERE 18;

-- Also test with explicit true constant
SELECT count()
FROM t_prewhere_const_patches
PREWHERE 1;

-- Test with false constant (should return 0)
SELECT count()
FROM t_prewhere_const_patches
PREWHERE 0;

-- Test the original fuzzed query pattern with simpler output
SELECT
    b,
    c,
    count()
FROM t_prewhere_const_patches
PREWHERE 18
GROUP BY
    b,
    c
ORDER BY
    b ASC,
    c ASC;