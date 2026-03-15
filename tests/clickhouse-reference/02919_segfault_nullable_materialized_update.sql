CREATE TABLE crash_02919 (
    b Int64,
    c Nullable(Int64) MATERIALIZED b,
    d Nullable(Bool) MATERIALIZED b
)
ENGINE = MergeTree
ORDER BY tuple();
SELECT b, c, d FROM crash_02919;
