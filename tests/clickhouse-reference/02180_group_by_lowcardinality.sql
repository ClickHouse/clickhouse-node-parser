-- Tags: no-random-settings

create table if not exists t_group_by_lowcardinality(p_date Date, val LowCardinality(Nullable(String))) 
engine=MergeTree() partition by p_date order by tuple();
select val, avg(toUInt32(val)) from t_group_by_lowcardinality group by val limit 10 settings max_threads=1, max_rows_to_group_by=100, group_by_overflow_mode='any' format JSONEachRow;
