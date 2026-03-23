-- Tags: zookeeper, no-parallel, no-shared-merge-tree
-- no-shared-merge-tree: doesn't support databases without UUID
SYSTEM drop  database if exists test_1164_memory;

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

SYSTEM drop  database test_1164_memory;