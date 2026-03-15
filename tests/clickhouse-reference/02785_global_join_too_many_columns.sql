create table local (a UInt64, b UInt64, c UInt64, d UInt64, e UInt64, f UInt64, g UInt64, h UInt64) engine = Log;
create table distr as local engine = Distributed('test_cluster_two_shards', currentDatabase(), local);
set max_columns_to_read=1;
select count() from distr as l global all left join distr as r on l.a = r.a;
