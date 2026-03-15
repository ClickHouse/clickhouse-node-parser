CREATE TABLE table_for_ttl
(
    d DateTime,
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY key;

SELECT count()
FROM table_for_ttl;

SELECT countDistinct(value)
FROM table_for_ttl;