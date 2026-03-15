-- Tags: no-azure-blob-storage
CREATE TABLE nation
(
    n_nationkey Int32,
    n_name String
)
ENGINE = MergeTree
ORDER BY n_nationkey;

CREATE TABLE customer
(
    c_custkey Int32,
    c_nationkey Int32,
    c_nationkey_copy Int32
)
ENGINE = MergeTree
ORDER BY c_custkey
SETTINGS index_granularity = 10;

SET enable_analyzer = 1;

SET enable_parallel_replicas = 0;

SET enable_join_runtime_filters = 0;

SET query_plan_join_swap_table = 0;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
RIGHT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
RIGHT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
LEFT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;

SELECT count()
FROM
    customer
RIGHT JOIN nation
    ON c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_custkey = 1;