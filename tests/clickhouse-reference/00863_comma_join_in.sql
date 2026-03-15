create table test1_00863 (id UInt64, code String) engine = Memory;
create table test3_00863 (id UInt64, code String) engine = Memory;
create table test2_00863 (id UInt64, code String, test1_id UInt64, test3_id UInt64) engine = Memory;
-- `parallel_hash` uses two-level hash tables (that have 256 tables internally), each preallocates 256 elements by default,
-- so we're getting max_threads * 256 * 256 * number_of_joins 
SET max_memory_usage = 300000000;
select test2_00863.id
from test1_00863, test2_00863, test3_00863
where test1_00863.code in ('1', '2', '3')
    and test2_00863.test1_id = test1_00863.id
    and test2_00863.test3_id = test3_00863.id
order by all;
