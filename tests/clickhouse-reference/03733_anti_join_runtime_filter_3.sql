SET enable_analyzer = 1;
SET enable_join_runtime_filters = 1;
CREATE TABLE nation(n_nationkey Int32, n_name String) ENGINE MergeTree ORDER BY n_nationkey;
CREATE TABLE customer(c_custkey Int32, c_nationkey Int32) ENGINE MergeTree ORDER BY c_custkey;
SET enable_parallel_replicas=0;
SET query_plan_join_swap_table=0;
-- 1 element in filter
SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name = 'FRANCE') as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name = 'FRANCE') as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- 0 elements in filter ('WAKANDA' is not present in `nations` table)
SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name = 'WAKANDA') as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name = 'WAKANDA') as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- again 1 element in filter

SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name IN ('WAKANDA', 'GERMANY')) as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name IN ('WAKANDA', 'GERMANY')) as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- 2 elements in filter
SELECT count()
FROM
        customer
    LEFT ANTI JOIN
        (SELECT n_nationkey FROM nation WHERE n_name IN ('FRANCE', 'GERMANY')) as n
    ON c_nationkey = n.n_nationkey;
SELECT count()
FROM
        (SELECT n_nationkey FROM nation WHERE n_name IN ('FRANCE', 'GERMANY')) as n
    RIGHT ANTI JOIN
        customer
    ON c_nationkey = n.n_nationkey;
-- 2 elements in filter store in a bloom filter
SET join_runtime_filter_exact_values_limit = 1;
