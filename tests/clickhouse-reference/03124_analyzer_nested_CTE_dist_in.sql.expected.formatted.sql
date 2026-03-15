-- https://github.com/ClickHouse/ClickHouse/issues/23865
SET enable_analyzer = 1;

CREATE TABLE table_local
ENGINE = Memory AS
SELECT *
FROM numbers(10);

CREATE TABLE table_dist AS table_local
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), table_local);