CREATE TABLE table_with_column_ttl
(
    EventTime DateTime,
    UserID UInt64,
    Age UInt8 TTL EventTime + INTERVAL 3 MONTH
)
ENGINE MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0; -- column TTL doesn't work for compact parts
SELECT UserID, Age FROM table_with_column_ttl ORDER BY UserID;
