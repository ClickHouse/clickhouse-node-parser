SET optimize_read_in_order = 1;

CREATE TABLE mytable
(
    timestamp UInt64,
    insert_timestamp UInt64,
    key UInt64,
    value Float64
)
ENGINE = ReplacingMergeTree(insert_timestamp)
ORDER BY (key, timestamp)
PRIMARY KEY (key, timestamp);

SELECT
    timestamp,
    value
FROM mytable FINAL
WHERE key = 5
ORDER BY timestamp DESC;

SELECT if(like(`explain`, '%ReadType: InOrder%'), 'Ok', concat('Error: ', `explain`))
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            timestamp,
            value
        FROM mytable FINAL
        WHERE key = 5
        ORDER BY timestamp ASC
        SETTINGS enable_vertical_final = 0
    )
WHERE like(`explain`, '%ReadType%');

SELECT if(like(`explain`, '%ReadType: Default%'), 'Ok', concat('Error: ', `explain`))
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            timestamp,
            value
        FROM mytable FINAL
        WHERE key = 5
        ORDER BY timestamp DESC
    )
WHERE like(`explain`, '%ReadType%');