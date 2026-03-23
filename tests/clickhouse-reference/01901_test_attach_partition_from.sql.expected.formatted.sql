CREATE TABLE test_alter_attach_01901S
(
    A Int64,
    D date
)
ENGINE = MergeTree
ORDER BY A
PARTITION BY D;

INSERT INTO test_alter_attach_01901S;

CREATE TABLE test_alter_attach_01901D
(
    A Int64,
    D date
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_alter_attach_01901D', 'r1')
ORDER BY A
PARTITION BY D;

SELECT count()
FROM test_alter_attach_01901D;

SELECT count()
FROM test_alter_attach_01901S;