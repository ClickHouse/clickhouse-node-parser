SET send_logs_level = 'fatal';
CREATE TABLE test_table (n Int32, s String) ENGINE MergeTree PARTITION BY n ORDER BY n;
CREATE TABLE mview_backend (n Int32, n2 Int64) ENGINE MergeTree PARTITION BY n ORDER BY n;
CREATE MATERIALIZED VIEW mview TO mview_backend AS SELECT n, n * n AS "n2" FROM test_table;
SELECT n,s  FROM test_table ORDER BY n;
SELECT n,n2 FROM mview ORDER by n;
