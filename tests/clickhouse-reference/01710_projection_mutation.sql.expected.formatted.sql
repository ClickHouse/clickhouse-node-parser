CREATE TABLE t
(
    key UInt32,
    created_at Date,
    value UInt32,
    PROJECTION xxx (    SELECT
        key,
        created_at,
        sum(value)
    GROUP BY
        key,
        created_at)
)
ENGINE = MergeTree
ORDER BY key
PARTITION BY toYYYYMM(created_at);