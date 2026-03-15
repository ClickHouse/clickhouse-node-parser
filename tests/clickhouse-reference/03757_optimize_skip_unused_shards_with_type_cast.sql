create table t1 (Col LowCardinality(String)) engine = MergeTree;
select * from remote('127.{1,2}', currentDatabase(), t1, multiIf(Col = 'a', 0, Col = 'b', 1, -1)) where Col in ('a', 'b') order by all settings optimize_skip_unused_shards=1;
