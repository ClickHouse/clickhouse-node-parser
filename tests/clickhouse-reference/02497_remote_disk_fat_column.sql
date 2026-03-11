-- Too large sizes of FixedString to deserialize
select x from fat_granularity prewhere fat like '256\_%' settings max_threads=2;
