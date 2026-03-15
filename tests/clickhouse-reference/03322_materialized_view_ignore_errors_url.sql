CREATE TABLE src (x int) ORDER BY ();
CREATE TABLE dst (x int) AS url('http://127.0.0.1/', JSONEachRow, 'x int');
CREATE MATERIALIZED VIEW mv TO dst AS SELECT * FROM src;
--- value 2 should be in src, value 1 could be in src
SELECT * FROM src WHERE x = 2;
