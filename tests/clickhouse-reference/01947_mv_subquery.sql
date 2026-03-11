SELECT '1947 #1 CHECK - TRUE' as test,
       ProfileEvents['SleepFunctionCalls'] as sleep_calls,
       ProfileEvents['SleepFunctionMicroseconds'] as sleep_microseconds
FROM system.query_log
WHERE query like '%CREATE MATERIALIZED VIEW src2dst_true%'
  AND type > 1
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
    FORMAT JSONEachRow;
SELECT '1947 #2 CHECK - TRUE' as test,
       ProfileEvents['SleepFunctionCalls'] as sleep_calls,
       ProfileEvents['SleepFunctionMicroseconds'] as sleep_microseconds
FROM system.query_log
WHERE query like '%INSERT into src SELECT number + 100 as id, 1 FROM numbers(2)%'
  AND type > 1
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
    FORMAT JSONEachRow;
SELECT '1947 #3 CHECK - TRUE' as test,
       ProfileEvents['SleepFunctionCalls'] as sleep_calls,
       ProfileEvents['SleepFunctionMicroseconds'] as sleep_microseconds
FROM system.query_log
WHERE query like '%DESCRIBE ( SELECT ''1947 #3 QUERY - TRUE'',%'
  AND type > 1
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
    FORMAT JSONEachRow;
SELECT '1947 #1 CHECK - FALSE' as test,
       ProfileEvents['SleepFunctionCalls'] as sleep_calls,
       ProfileEvents['SleepFunctionMicroseconds'] as sleep_microseconds
FROM system.query_log
WHERE query like '%CREATE MATERIALIZED VIEW src2dst_false%'
  AND type > 1
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
    FORMAT JSONEachRow;
SELECT '1947 #2 CHECK - FALSE' as test,
       ProfileEvents['SleepFunctionCalls'] as sleep_calls,
       ProfileEvents['SleepFunctionMicroseconds'] as sleep_microseconds
FROM system.query_log
WHERE query like '%INSERT into src SELECT number + 200 as id, 1 FROM numbers(2)%'
  AND type > 1
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
    FORMAT JSONEachRow;
SELECT '1947 #3 CHECK - FALSE' as test,
       ProfileEvents['SleepFunctionCalls'] as sleep_calls,
       ProfileEvents['SleepFunctionMicroseconds'] as sleep_microseconds
FROM system.query_log
WHERE query like '%DESCRIBE ( SELECT ''1947 #3 QUERY - FALSE'',%'
  AND type > 1
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
    FORMAT JSONEachRow;
