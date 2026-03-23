DROP TABLE IF EXISTS t1;

CREATE TABLE t1 AS remote('localhost', 'system.one');

SELECT *
FROM t2;

DROP TABLE t1;