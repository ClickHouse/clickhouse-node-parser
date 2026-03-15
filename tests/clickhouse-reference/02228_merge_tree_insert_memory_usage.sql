-- Tags: long, no-object-storage
-- no-object-storage: Avoid flakiness due to cache / buffer usage
SET insert_keeper_fault_injection_probability=0; -- to succeed this test can require too many retries due to 100 partitions, so disable fault injections
create table data_02228 (key1 UInt32, sign Int8, s UInt64) engine = CollapsingMergeTree(sign) order by (key1) partition by key1 % 100 settings auto_statistics_types = '';
create table data_rep_02228 (key1 UInt32, sign Int8, s UInt64) engine = ReplicatedCollapsingMergeTree('/clickhouse/{database}', 'r1', sign) order by (key1) partition by key1 % 100 settings auto_statistics_types = '';
