-- Tags: zookeeper, no-parallel, no-shared-merge-tree
-- no-shared-merge-tree: doesn't support databases without UUID
DROP DATABASE IF EXISTS test_1164_memory;

CREATE DATABASE test_1164_memory
ENGINE = Memory;

CREATE TABLE test_1164_memory.r1
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/01164/{database}/t', '1')
ORDER BY n;

CREATE TABLE test_1164_memory.r2
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/01164/{database}/t', '2')
ORDER BY n;

DROP DATABASE test_1164_memory;