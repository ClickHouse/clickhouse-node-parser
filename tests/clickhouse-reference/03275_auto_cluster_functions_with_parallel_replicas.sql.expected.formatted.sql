-- Tags: no-fasttest
-- Tag no-fasttest: Depends on Minio
SET enable_analyzer = 1;

SET enable_parallel_replicas = 1;

SET max_parallel_replicas = 4;

SET cluster_for_parallel_replicas = 'test_cluster_two_shards';

SET query_plan_join_swap_table = 0;

SET enable_join_runtime_filters = 0;

SET parallel_replicas_for_cluster_engines = true;

SELECT count()
FROM s3('http://localhost:11111/test/a.tsv', 'TSV');

CREATE TABLE dupe_test_with_auto_functions
(
    n1 String,
    n2 String,
    n3 String
)
ENGINE = MergeTree
ORDER BY n1;

SELECT count()
FROM dupe_test_with_auto_functions;

CREATE TABLE insert_with_url_function
(
    n1 String,
    n2 String,
    n3 String
)
ENGINE = MergeTree
ORDER BY n1;

SELECT count()
FROM insert_with_url_function;

SET parallel_replicas_for_cluster_engines = false;

CREATE TABLE dupe_test_without_cluster_functions
(
    n1 String,
    n2 String,
    n3 String
)
ENGINE = MergeTree
ORDER BY n1;

SELECT count()
FROM dupe_test_without_cluster_functions;

CREATE TABLE dupe_test_with_cluster_function
(
    n1 String,
    n2 String,
    n3 String
)
ENGINE = MergeTree
ORDER BY n1;

SELECT count()
FROM dupe_test_with_cluster_function;