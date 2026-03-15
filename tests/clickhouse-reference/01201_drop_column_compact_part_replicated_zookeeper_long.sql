-- Tags: long, replica

-- in case of keeper fault injection on insert, set bigger number of retries because partitions
set insert_keeper_max_retries=100;
set insert_keeper_retry_max_backoff_ms=10;
-- Testing basic functionality with compact parts
set replication_alter_partitions_sync = 2;
create table mt_compact(a UInt64, b UInt64 DEFAULT a * a, s String, n Nested(x UInt32, y String), lc LowCardinality(String))
engine = ReplicatedMergeTree('/clickhouse/{database}/test_01201/mt_compact_replicated', '1')
order by a partition by a % 10
settings index_granularity = 8,
min_rows_for_wide_part = 10;
select * from mt_compact order by a, s limit 10;
select * from mt_compact where a > 1 order by a, s limit 10;
