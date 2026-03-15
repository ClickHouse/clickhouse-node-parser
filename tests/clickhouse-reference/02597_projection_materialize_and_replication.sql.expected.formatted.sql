CREATE TABLE test
(
    c_id String,
    p_id String,
    d String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/test_table', '1')
ORDER BY (c_id, p_id);

SET mutations_sync = 0;

SELECT *
FROM test
FORMAT Null;