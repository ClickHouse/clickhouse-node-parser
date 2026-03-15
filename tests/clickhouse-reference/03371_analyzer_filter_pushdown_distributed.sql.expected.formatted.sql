SET enable_analyzer = 1;

CREATE TABLE bug_table
(
    date_column Date,
    c1 String,
    c2 String
)
ENGINE = MergeTree
ORDER BY (c1, c2)
PARTITION BY toYYYYMM(date_column);

CREATE TABLE distributed_bug_table
(
    date_column Date,
    c1 String,
    c2 String
)
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), 'bug_table', cityHash64(c1));

SET distributed_product_mode = 'allow';

SET prefer_localhost_replica = 1;

SET prefer_localhost_replica = 0;