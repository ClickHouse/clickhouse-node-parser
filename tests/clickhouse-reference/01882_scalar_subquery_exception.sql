create table nums_in_mem(v UInt64) engine=Memory;
create table nums_in_mem_dist as nums_in_mem engine=Distributed('test_shard_localhost', currentDatabase(), nums_in_mem);
set prefer_localhost_replica = 0;
set max_rows_to_read = 100;
select
  count()
    /
  (select count() from nums_in_mem_dist where rand() > 0)
from system.one; -- { serverError TOO_MANY_ROWS }
