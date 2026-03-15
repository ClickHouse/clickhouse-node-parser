CREATE TABLE empty_pk
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 256, index_granularity_bytes = '10Mi';

SELECT sum(x)
FROM empty_pk;