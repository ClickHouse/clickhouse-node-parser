CREATE TABLE table1 (id UInt64, val Nullable(UInt64)) ENGINE = MergeTree ORDER BY id;
CREATE TABLE table3 (id UInt64) ENGINE = MergeTree ORDER BY id;
CREATE TABLE table4 (v UInt64) ENGINE = MergeTree ORDER BY v;
CREATE TABLE table2 (id UInt64) ENGINE = MergeTree ORDER BY id;
SET query_plan_optimize_join_order_limit = 16;
SELECT table1.id
FROM table1
INNER JOIN table2 ON table1.id = table2.id
INNER JOIN table3 ON table1.id = table3.id
LEFT JOIN table4 ON (table1.val = table4.v) AND (table3.id = table4.v)
ORDER BY table1.id
;
