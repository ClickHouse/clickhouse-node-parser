create table t_local(a int) engine Log;
create table t_dist (a int) engine Distributed(test_shard_localhost, currentDatabase(), 't_local', cityHash64(a));
set distributed_foreground_insert = 1;
insert into t_dist values (1);
