CREATE TABLE enum_test
(
    timestamp DateTime,
    host String,
    e Enum8('IU' = 1, 'WS' = 2)
)
ENGINE = MergeTree
ORDER BY (timestamp, host)
PARTITION BY toDate(timestamp);

SELECT *
FROM enum_test
ORDER BY
    timestamp ASC,
    e DESC
SETTINGS optimize_read_in_order = 1;