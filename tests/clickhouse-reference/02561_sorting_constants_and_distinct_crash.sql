CREATE TABLE test_table (string_value String) ENGINE = MergeTree ORDER BY string_value SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select distinct
    'constant_1' as constant_value,
    count(*) over(partition by constant_value, string_value) as value_cnt
from (
    select string_value
    from test_table
)
order by all;
select distinct
 'constant_1' as constant_value, *
 from (select string_value from test_table)
 ORDER BY constant_value, string_value settings max_threads=1;
