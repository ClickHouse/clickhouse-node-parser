select a from remote(test_cluster_two_shards, currentDatabase(), t) group by a order by a limit 5 offset 100500;
select a from remote(test_cluster_two_shards, currentDatabase(), dist_t) group by a order by a limit 5 offset 100500;
-- actual block size might be slightly bigger than the limit --
select max(bs) < 70000 from (select avg(a), max(blockSize()) as bs from remote(test_cluster_two_shards, currentDatabase(), t) group by a);
select a, count() from dist_t_different_dbs group by a order by a limit 5 offset 500;
select a, count() from dist_t_different_dbs group by a, b order by a limit 5 offset 500;
select count() from pr_t;
select a, count() from pr_t group by a order by a limit 5 offset 500;
select a, count() from pr_t group by a, b order by a limit 5 offset 500;
