SET enable_analyzer=1;
CREATE TABLE table0 (id Int64, val String) Engine=MergeTree ORDER BY id;
CREATE TABLE table1 (id2 Int64, val String) Engine=MergeTree ORDER BY id2;
CREATE TABLE table2 (id Int64, id2 Int64, val String) Engine=MergeTree ORDER BY (id, id2);
-- { echoOn }
SELECT * FROM table0 JOIN table2 USING id JOIN table1 USING id2 ORDER BY ALL;
SELECT * FROM table0 AS t0 JOIN table2 USING val JOIN table1 USING val ORDER BY ALL;
