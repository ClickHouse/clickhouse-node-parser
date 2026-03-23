-- Tags: no-parallel
-- Tag no-parallel: creates database
SYSTEM drop  database if exists db_01530_atomic sync;

CREATE DATABASE db_01530_atomic
ENGINE = Atomic;

CREATE TABLE db_01530_atomic.data
(
    key Int
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/db_01530_atomic/data', 'test')
ORDER BY key;

SYSTEM drop  database db_01530_atomic sync;

SET database_atomic_wait_for_drop_and_detach_synchronously = 1;

SYSTEM drop  database db_01530_atomic;

SET database_atomic_wait_for_drop_and_detach_synchronously = 0;