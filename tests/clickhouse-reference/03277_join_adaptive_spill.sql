create table adaptive_spill_03277_1 (`k` String, `x` String ) Engine=Memory;
create table adaptive_spill_03277_2 (`k` String, `x` String ) Engine=Memory;
create table adaptive_spill_03277_3 (`k` String, `x` String ) Engine=Memory;
set max_threads=4;
set join_algorithm='grace_hash';
set max_bytes_in_join=0;
--set max_memory_usage=629145600

set enable_adaptive_memory_spill_scheduler=true;
select * from (select t1.k as k, t1.x as x1, t2.x as x2, t3.x as x3 from adaptive_spill_03277_1 as t1 left join adaptive_spill_03277_2 as t2 on t1.k = t2.k left join adaptive_spill_03277_3 as t3 on t1.k = t3.k) order by k, x1, x2, x3 limit 100;
