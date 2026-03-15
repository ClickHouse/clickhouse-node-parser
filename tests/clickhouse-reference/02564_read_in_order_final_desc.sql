SET optimize_read_in_order = 1;
CREATE TABLE mytable
(
    timestamp        UInt64,
    insert_timestamp UInt64,
    key              UInt64,
    value            Float64
) ENGINE = ReplacingMergeTree(insert_timestamp)
    PRIMARY KEY (key, timestamp)
    ORDER BY (key, timestamp);
SELECT timestamp, value
FROM mytable FINAL
WHERE key = 5
ORDER BY timestamp DESC;
SELECT if(explain like '%ReadType: InOrder%', 'Ok', 'Error: ' || explain) FROM (
    EXPLAIN PLAN actions = 1
    SELECT timestamp, value
    FROM mytable FINAL
    WHERE key = 5
    ORDER BY timestamp SETTINGS enable_vertical_final = 0
) WHERE explain like '%ReadType%';
SELECT if(explain like '%ReadType: Default%', 'Ok', 'Error: ' || explain) FROM (
    EXPLAIN PLAN actions = 1
    SELECT timestamp, value
    FROM mytable FINAL
    WHERE key = 5
    ORDER BY timestamp DESC
) WHERE explain like '%ReadType%';
