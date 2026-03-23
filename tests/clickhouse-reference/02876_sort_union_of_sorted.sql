CREATE TABLE table1 (number UInt64) ENGINE=MergeTree ORDER BY tuple();
CREATE TABLE table2 (number UInt64) ENGINE=MergeTree ORDER BY tuple();
INSERT INTO table1 SELECT number FROM numbers_mt(1, 10);
INSERT INTO table2 SELECT number FROM numbers_mt(11, 10);
SELECT * FROM ((SELECT * FROM table1 ORDER BY number) UNION ALL (SELECT * FROM table2 ORDER BY number)) ORDER BY number;
SELECT * FROM ((SELECT * FROM table1 ORDER BY number) UNION ALL (SELECT * FROM table2 ORDER BY number)) ORDER BY number DESC;
SELECT * FROM ((SELECT * FROM table1 ORDER BY number DESC) UNION ALL (SELECT * FROM table2 ORDER BY number DESC)) ORDER BY number DESC;
