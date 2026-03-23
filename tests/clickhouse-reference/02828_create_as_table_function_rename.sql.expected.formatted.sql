SYSTEM drop  table if exists t1;

CREATE TABLE t1 AS remote('localhost', 'system.one');

SELECT *
FROM t2;

SYSTEM drop  table t1;