-- Tags: distributed

set enable_parallel_replicas = 1;
set parallel_replicas_mode = 'sampling_key';
set max_parallel_replicas = 3;
set parallel_replicas_for_non_replicated_merge_tree = 1;
create table sample_final (CounterID UInt32, EventDate Date, EventTime DateTime, UserID UInt64, Sign Int8) engine = CollapsingMergeTree(Sign) order by (CounterID, EventDate, intHash32(UserID), EventTime) sample by intHash32(UserID) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select count() from sample_final;
select count() from sample_final final;
select count() from sample_final sample 1/2;
select count() from sample_final final sample 1/2;
set max_parallel_replicas=2;
select count() from remote('127.0.0.{2|3}', currentDatabase(), sample_final) final;
