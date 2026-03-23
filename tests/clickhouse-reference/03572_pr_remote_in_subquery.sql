set enable_analyzer = 1;
set enable_parallel_replicas=1, max_parallel_replicas=2, parallel_replicas_local_plan=1;
select '-- SELECT';
SELECT * FROM (SELECT dummy AS k FROM remote('127.0.0.{1,2}', system.one));
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (c0 Int, c1 Int) ENGINE MergeTree() ORDER BY tuple();
INSERT INTO t0 VALUES(0, 1);
DROP TABLE t0;
