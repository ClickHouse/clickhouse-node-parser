-- Tags: distributed

create table if not exists sample_prewhere (date Date, id Int32, time Int64) engine = MergeTree partition by date order by (id, time, intHash64(time)) sample by intHash64(time);
select id from remote('127.0.0.{1,3}', currentDatabase(), sample_prewhere) SAMPLE 1 where toDateTime(time) = '2019-07-20 00:00:00';
