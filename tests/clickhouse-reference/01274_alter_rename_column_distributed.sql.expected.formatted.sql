-- Tags: distributed
SET distributed_foreground_insert = 1;

CREATE TABLE visits
(
    StartDate Date,
    Name String
)
ENGINE = MergeTree
ORDER BY (StartDate);

CREATE TABLE visits_dist AS visits
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), 'visits', rand());

INSERT INTO visits_dist (StartDate, Name);

INSERT INTO visits_dist (StartDate, Name);

SELECT *
FROM visits_dist
ORDER BY
    StartDate ASC,
    Name2 ASC;