set log_queries=1;
set log_queries_min_type='QUERY_FINISH';
CREATE TABLE 02751_query_log_test_partitions (a Int64, b Int64) ENGINE = MergeTree PARTITION BY a ORDER BY b;
SELECT * FROM 02751_query_log_test_partitions WHERE a = 3;
SELECT
    --Remove the prefix string which is a mutable database name.
    arrayStringConcat(arrayPopFront(splitByString('.', partitions[1])), '.')
FROM
    system.query_log
WHERE
    current_database=currentDatabase() and
    query = 'SELECT * FROM 02751_query_log_test_partitions WHERE a = 3;'
