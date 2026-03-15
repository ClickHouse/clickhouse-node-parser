CREATE TABLE r1
(
    key UInt64,
    value String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01509_parallel_quorum_insert_no_replicas', '1')
ORDER BY tuple();

CREATE TABLE r2
(
    key UInt64,
    value String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01509_parallel_quorum_insert_no_replicas', '2')
ORDER BY tuple();

SET insert_quorum_parallel = 1;

SET insert_quorum = 3;

SET insert_quorum = 2, insert_quorum_parallel = 1;

SELECT COUNT()
FROM r1;

SELECT COUNT()
FROM r2;

SET insert_quorum = 1, insert_quorum_parallel = 1;

-- will start failing if we increase quorum
SET insert_quorum = 3, insert_quorum_parallel = 1;

SET insert_quorum_timeout = 0;

SELECT *
FROM r2
WHERE key = 4;

SET insert_quorum_timeout = 6000000;