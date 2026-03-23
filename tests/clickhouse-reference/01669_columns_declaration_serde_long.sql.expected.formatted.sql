-- Tags: long
CREATE TEMPORARY TABLE test
(
    `\\` String DEFAULT concat('\r\n\t\\', '
')
);

INSERT INTO test;

INSERT INTO test (`\\`);

SELECT *
FROM test;

CREATE TABLE test
(
    x UInt64,
    `\\` String DEFAULT concat('\r\n\t\\', '
')
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO test (x);

CREATE TABLE test_r1
(
    x UInt64,
    `\\` String DEFAULT concat('\r\n\t\\', '
')
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01669', 'r1')
ORDER BY `\\`
SETTINGS ratio_of_defaults_for_sparse_serialization = 1.0;

INSERT INTO test_r1 (`\\`);

CREATE TABLE test_r2
(
    x UInt64,
    `\\` String DEFAULT concat('\r\n\t\\', '
')
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01669', 'r2')
ORDER BY `\\`
SETTINGS ratio_of_defaults_for_sparse_serialization = 1.0;

SELECT '---';

SELECT *
FROM test_r1;

SELECT *
FROM test_r2;