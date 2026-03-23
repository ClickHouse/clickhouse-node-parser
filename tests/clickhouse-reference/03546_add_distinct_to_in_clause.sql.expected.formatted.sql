-- Tags: shard, no-parallel
SYSTEM drop  table if exists local_table_1;

SYSTEM drop  table if exists local_table_2;

SYSTEM drop  table if exists distributed_table_1;

SYSTEM drop  table if exists distributed_table_2;

SET prefer_localhost_replica = 0;

SET allow_experimental_analyzer = 1;

SET distributed_product_mode = 'allow';

SET prefer_global_in_and_join = 1;

SET max_rows_to_read = 100000000;

SET read_overflow_mode = 'break';

CREATE TABLE local_table_1
(
    id int
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE local_table_2
(
    id int
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE distributed_table_1
(
    id int
)
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), local_table_1);

CREATE TABLE distributed_table_2
(
    id int
)
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), local_table_2);

INSERT INTO local_table_1 SELECT number
FROM numbers(100);

INSERT INTO local_table_2 SELECT 1
FROM numbers(1000000);

INSERT INTO local_table_2 SELECT 2
FROM numbers(1000000);

INSERT INTO local_table_2 SELECT 3
FROM numbers(1000000);

SELECT id
FROM distributed_table_1
WHERE id IN (
        SELECT id
        FROM distributed_table_2
    )
SETTINGS enable_add_distinct_to_in_subqueries = 1;

-- Query with DISTINCT optimization disabled
SELECT id
FROM distributed_table_1
WHERE id IN (
        SELECT id
        FROM distributed_table_2
    )
SETTINGS enable_add_distinct_to_in_subqueries = 0;