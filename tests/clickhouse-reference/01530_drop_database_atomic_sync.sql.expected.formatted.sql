CREATE DATABASE db_01530_atomic
ENGINE = Atomic;

CREATE TABLE db_01530_atomic.data
(
    key Int
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/db_01530_atomic/data', 'test')
ORDER BY key;

SET database_atomic_wait_for_drop_and_detach_synchronously = 1;

SET database_atomic_wait_for_drop_and_detach_synchronously = 0;