-- Tags: distributed

set distributed_foreground_insert = 1;
CREATE TABLE visits(StartDate Date, Name String) ENGINE MergeTree ORDER BY(StartDate);
CREATE TABLE visits_dist AS visits ENGINE Distributed(test_cluster_two_shards_localhost,  currentDatabase(), 'visits', rand());
SELECT * FROM visits_dist ORDER BY StartDate, Name2;
