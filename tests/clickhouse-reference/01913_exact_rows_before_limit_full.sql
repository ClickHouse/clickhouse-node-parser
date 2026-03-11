select * from test limit 1 FORMAT JSONCompact;
select * from test where i < 10 group by i order by i limit 1 FORMAT JSONCompact;
select * from test group by i having i in (10, 11, 12) order by i limit 1 FORMAT JSONCompact;
select * from test where i < 20 order by i limit 1 FORMAT JSONCompact;
select * from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 30 order by i limit 1 FORMAT JSONCompact;
select * from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 20 order by i limit 1 FORMAT JSONCompact;
select * from (select * from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 10) order by i limit 1 FORMAT JSONCompact;
