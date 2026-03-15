CREATE TABLE IF NOT EXISTS null_01016
(
    x Nullable(String)
)
ENGINE = MergeTree
ORDER BY ifNull(x, 'order-null')
PARTITION BY ifNull(x, 'partition-null');