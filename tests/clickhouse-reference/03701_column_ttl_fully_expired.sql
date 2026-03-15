create table x (dt DateTime, i Int32 default 42 ttl dt + toIntervalDay(1), index idx(i) type set(100)) engine MergeTree partition by indexHint(dt) order by dt settings index_granularity = 8192, min_bytes_for_wide_part = 0;
select i from x where i = 1;
select i from x where i = 42;
create table x (dt DateTime, i Int32 default 42 ttl dt + toIntervalDay(1)) engine ReplacingMergeTree(i) order by dt settings index_granularity = 8192, min_bytes_for_wide_part = 0;
create table x (dt DateTime, i Int32 default 42 ttl dt + toIntervalDay(1)) engine MergeTree order by dt settings index_granularity = 8192, min_bytes_for_wide_part = 0;
select i from x;
