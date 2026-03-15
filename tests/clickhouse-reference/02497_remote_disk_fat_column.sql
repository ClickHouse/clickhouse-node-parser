-- Tags: no-random-settings, no-fasttest, no-tsan, no-asan, no-msan
set allow_suspicious_fixed_string_types=1;
create table fat_granularity (x UInt32, fat FixedString(160000)) engine = MergeTree order by x settings storage_policy = 's3_cache';
SET max_memory_usage='10G';
-- Too large sizes of FixedString to deserialize
select x from fat_granularity prewhere fat like '256\_%' settings max_threads=2;
