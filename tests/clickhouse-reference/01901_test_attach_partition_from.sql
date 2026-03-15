CREATE TABLE test_alter_attach_01901S (A Int64, D date) ENGINE = MergeTree PARTITION BY D ORDER BY A;
CREATE TABLE test_alter_attach_01901D (A Int64, D date) 
Engine=ReplicatedMergeTree('/clickhouse/tables/{database}/test_alter_attach_01901D', 'r1')
PARTITION BY D ORDER BY A;
SELECT count() FROM test_alter_attach_01901D;
SELECT count() FROM test_alter_attach_01901S;
