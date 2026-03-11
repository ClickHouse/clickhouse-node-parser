select * from test where i < 10 group by i order by i FORMAT JSONCompact;
select * from test where i < 10 group by i order by i FORMAT XML;
select * from test group by i having i in (10, 11, 12) order by i FORMAT JSONCompact;
select * from test where i < 20 group by i order by i FORMAT JSONCompact;
select max(i) from test where i < 20 limit 1 FORMAT JSONCompact;
select * from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 30 group by i order by i FORMAT JSONCompact;
select * from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 20 group by i order by i FORMAT JSONCompact;
select max(i) from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 20 FORMAT JSONCompact;
select * from (select * from cluster(test_cluster_two_shards, currentDatabase(), test) where i < 10) group by i order by i limit 10 FORMAT JSONCompact;
