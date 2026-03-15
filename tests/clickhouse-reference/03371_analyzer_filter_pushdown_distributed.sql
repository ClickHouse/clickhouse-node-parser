set enable_analyzer=1;
CREATE TABLE bug_table
(
    `date_column` Date,
    `c1` String,
    `c2` String
)
ENGINE =  MergeTree
PARTITION BY toYYYYMM(date_column)
ORDER BY (c1, c2);
CREATE TABLE distributed_bug_table
(
date_column Date,
c1 String,
c2 String
)
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), 'bug_table', cityHash64(c1));
set distributed_product_mode = 'allow';
set prefer_localhost_replica=1;
set prefer_localhost_replica=0;
