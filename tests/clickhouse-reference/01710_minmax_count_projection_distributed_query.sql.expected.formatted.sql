CREATE TABLE t
(
    n int,
    s String
)
ENGINE = MergeTree
ORDER BY n;

SELECT
    count(),
    count(n),
    count(s)
FROM cluster('test_cluster_two_shards', currentDatabase(), t);