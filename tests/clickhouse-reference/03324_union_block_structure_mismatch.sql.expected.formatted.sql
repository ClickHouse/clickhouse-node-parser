CREATE TABLE t0
(
    i Int32
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO t0 SELECT number
FROM numbers(1);

-- With force_optimize_projection=1, the projection code path is exercised.
-- The fix causes it to safely skip the optimization and return PROJECTION_NOT_USED error
-- instead of crashing with "Block structure mismatch in UnionStep".
SELECT 1
FROM t0
WHERE materialize(1)
SETTINGS force_optimize_projection = 1; -- { serverError PROJECTION_NOT_USED }