CREATE TABLE test
(
    c_id String,
    p_id String,
    d UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/test_table', '1')
ORDER BY (c_id, p_id);

SELECT *
FROM test
FORMAT Null;