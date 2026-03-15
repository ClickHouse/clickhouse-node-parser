CREATE TABLE test_03143 (
   timestamp DateTime,
   x UInt32 TTL timestamp + INTERVAL 1 MONTH,
   y String TTL timestamp + INTERVAL 1 DAY,
   z String
)
ENGINE = MergeTree
ORDER BY tuple();
SELECT
    name,
    column,
    type,
    column_ttl_min,
    column_ttl_max
FROM system.parts_columns
WHERE table = 'test_03143' and database = currentDatabase()
ORDER BY name, column;
