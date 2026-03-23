CREATE TABLE test
(
    c_id String,
    p_id String,
    d UInt32,
)
Engine = ReplicatedMergeTree('/clickhouse/tables/{database}/test/test_table', '1')
ORDER BY (c_id, p_id);
INSERT INTO test SELECT '1', '11', '111' FROM numbers(5);
SELECT * from test format Null;
