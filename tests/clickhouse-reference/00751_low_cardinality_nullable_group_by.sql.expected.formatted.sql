SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE low_null_float
(
    a LowCardinality(Nullable(Float64))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT
    a,
    count()
FROM low_null_float
GROUP BY a
ORDER BY
    count() DESC,
    a ASC
LIMIT 10;