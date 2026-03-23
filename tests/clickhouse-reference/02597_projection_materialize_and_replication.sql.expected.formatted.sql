CREATE TABLE test
(
    c_id String,
    p_id String,
    d String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/test_table', '1')
ORDER BY (c_id, p_id);

INSERT INTO test SELECT
    '1',
    '11',
    '111'
FROM numbers(30);

INSERT INTO test SELECT
    '2',
    '22',
    '22'
FROM numbers(30);

SET mutations_sync = 0;

SELECT *
FROM test
FORMAT Null;