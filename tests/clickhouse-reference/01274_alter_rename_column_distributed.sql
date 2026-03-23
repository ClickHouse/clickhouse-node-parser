-- Tags: distributed

set distributed_foreground_insert = 1;
CREATE TABLE visits(StartDate Date, Name String) ENGINE MergeTree ORDER BY(StartDate);
CREATE TABLE visits_dist AS visits ENGINE Distributed(test_cluster_two_shards_localhost,  currentDatabase(), 'visits', rand());
INSERT INTO visits_dist (StartDate, Name) VALUES ('2020-01-01', 'hello');
INSERT INTO visits_dist (StartDate, Name) VALUES ('2020-01-02', 'hello2');
SELECT * FROM visits_dist ORDER BY StartDate, Name2;
