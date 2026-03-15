CREATE TABLE enum_test(timestamp DateTime, host String, e Enum8('IU' = 1, 'WS' = 2)) Engine = MergeTree PARTITION BY toDate(timestamp) ORDER BY (timestamp, host);
SELECT * FROM enum_test ORDER BY timestamp, e desc SETTINGS optimize_read_in_order=1;
