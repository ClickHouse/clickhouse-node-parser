SET enable_analyzer = 1;

CREATE TABLE t
(
    id int,
    a int,
    b int
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE t_dist AS t
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), t, id);

SELECT a
FROM (
        SELECT
            a,
            b,
            count(*) AS v
        FROM t_dist
        GROUP BY ALL
    ) AS Z;