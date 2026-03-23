-- this test checks that null values are correctly serialized inside minmax index (issue #7113)
SYSTEM drop  table if exists null_01016;

CREATE TABLE IF NOT EXISTS null_01016
(
    x Nullable(String)
)
ENGINE = MergeTree
ORDER BY ifNull(x, 'order-null')
PARTITION BY ifNull(x, 'partition-null');

INSERT INTO null_01016;

SYSTEM drop  table null_01016;