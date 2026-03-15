create database db_01530_atomic Engine=Atomic;
create table db_01530_atomic.data (key Int) Engine=ReplicatedMergeTree('/clickhouse/tables/{database}/db_01530_atomic/data', 'test') order by key;
set database_atomic_wait_for_drop_and_detach_synchronously=1;
set database_atomic_wait_for_drop_and_detach_synchronously=0;
