SELECT *
FROM test_table
WHERE id = 1;

SELECT *
FROM test_table
WHERE id = 1
SETTINGS query_plan_optimize_primary_key = 0;