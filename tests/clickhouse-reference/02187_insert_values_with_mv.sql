--Tags: no-async-insert
-- no-async-insert because initial_query_id in system.query_views_log have query_id
--  of "secondary" flush query with query_kind: AsyncInsertFlush
CREATE TABLE IF NOT EXISTS data_a_02187 (a Int64) ENGINE=Memory;
CREATE TABLE IF NOT EXISTS data_b_02187 (a Int64) ENGINE=Memory;
CREATE MATERIALIZED VIEW IF NOT EXISTS mv1 TO data_b_02187 AS Select sleepEachRow(0.05) as a FROM data_a_02187;
CREATE MATERIALIZED VIEW IF NOT EXISTS mv2 TO data_b_02187 AS Select sleepEachRow(0.05) as a FROM data_a_02187;
CREATE MATERIALIZED VIEW IF NOT EXISTS mv3 TO data_b_02187 AS Select sleepEachRow(0.05) as a FROM data_a_02187;
CREATE MATERIALIZED VIEW IF NOT EXISTS mv4 TO data_b_02187 AS Select sleepEachRow(0.05) as a FROM data_a_02187;
CREATE MATERIALIZED VIEW IF NOT EXISTS mv5 TO data_b_02187 AS Select sleepEachRow(0.05) as a FROM data_a_02187;
SELECT 'VALUES', query_duration_ms >= 250
FROM system.query_log
WHERE
      current_database = currentDatabase()
  AND event_date >= yesterday()
  AND query LIKE '-- INSERT USING VALUES%'
  AND type = 'QueryFinish'
LIMIT 1;
SELECT 'TABLE', query_duration_ms >= 250
FROM system.query_log
WHERE
        current_database = currentDatabase()
  AND event_date >= yesterday()
  AND query LIKE '-- INSERT USING VALUES%'
  AND type = 'QueryFinish'
LIMIT 1;
