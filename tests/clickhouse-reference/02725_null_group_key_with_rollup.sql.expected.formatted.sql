SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE group_by_null_key
(
    c1 Nullable(Int32),
    c2 LowCardinality(Nullable(Int32))
)
ENGINE = Memory();

SELECT
    c1,
    count(*)
FROM group_by_null_key
GROUP BY c1
WITH TOTALS;

SELECT
    c2,
    count(*)
FROM group_by_null_key
GROUP BY c2
WITH TOTALS;

SELECT
    c1,
    count(*)
FROM group_by_null_key
GROUP BY ROLLUP(c1);

SELECT
    c2,
    count(*)
FROM group_by_null_key
GROUP BY ROLLUP(c2);