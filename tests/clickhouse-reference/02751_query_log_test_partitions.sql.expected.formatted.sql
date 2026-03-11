SELECT *
FROM `02751_query_log_test_partitions`
WHERE a = 3;

SELECT arrayStringConcat(arrayPopFront(splitByString('.', partitions[1])), '.')
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT * FROM 02751_query_log_test_partitions WHERE a = 3;';