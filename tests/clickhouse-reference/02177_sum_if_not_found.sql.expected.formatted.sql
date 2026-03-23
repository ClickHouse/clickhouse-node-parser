SELECT sumIf(1, 0);

SYSTEM DROP  TABLE IF EXISTS data;

SYSTEM DROP  TABLE IF EXISTS agg;

CREATE TABLE data
(
    n UInt32,
    t DateTime
)
ENGINE = Null;

CREATE TABLE agg
ENGINE = AggregatingMergeTree
ORDER BY tuple() AS
SELECT
    t,
    sumIF(n, 0)
FROM data
GROUP BY t; -- { serverError UNKNOWN_FUNCTION}

SYSTEM DROP  TABLE data;

SYSTEM DROP  TABLE agg;