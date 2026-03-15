-- Tags: no-parallel

-- fire all kinds of queries and then check if those are present in the system.query_log
SET log_comment='system.query_log logging test';
CREATE DATABASE sqllt;
CREATE TABLE sqllt.table
(
    i UInt8, s String
)
ENGINE = MergeTree PARTITION BY tuple() ORDER BY tuple();
CREATE VIEW sqllt.view AS SELECT i, s FROM sqllt.table;
CREATE DICTIONARY sqllt.dictionary (key UInt64, value UInt64) PRIMARY KEY key SOURCE(CLICKHOUSE(DB 'sqllt' TABLE 'table' HOST 'localhost' PORT 9001)) LIFETIME(0) LAYOUT(FLAT());
CREATE USER sqllt_user IDENTIFIED WITH PLAINTEXT_PASSWORD BY 'password';
CREATE ROLE sqllt_role;
CREATE POLICY sqllt_policy ON sqllt.table, sqllt.view, sqllt.dictionary AS PERMISSIVE TO ALL;
CREATE POLICY sqllt_row_policy ON sqllt.table, sqllt.view, sqllt.dictionary AS PERMISSIVE TO ALL;
CREATE QUOTA sqllt_quota KEYED BY user_name TO sqllt_role;
CREATE SETTINGS PROFILE sqllt_settings_profile SETTINGS interactive_delay = 200000;
SET log_profile_events=false;
SET DEFAULT ROLE sqllt_role TO sqllt_user;
SET log_comment='';
-- Try to filter out all possible previous junk events by excluding old log entries,
SELECT query_kind, query FROM system.query_log
WHERE
    log_comment LIKE '%system.query_log%' AND type == 'QueryStart' AND event_date >= yesterday()
    AND current_database == currentDatabase() AND is_internal = 0
ORDER BY event_time_microseconds;
