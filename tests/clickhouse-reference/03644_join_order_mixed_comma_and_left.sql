SET query_plan_optimize_join_order_limit=16;
CREATE TABLE n1 (number UInt64) ENGINE = MergeTree ORDER BY number;
CREATE TABLE n2 (number UInt64) ENGINE = MergeTree ORDER BY number;
CREATE TABLE n3 (number UInt64) ENGINE = MergeTree ORDER BY number;
SELECT * FROM n1, n2 LEFT JOIN n3 ON n1.number = n3.number ORDER BY n1.number, n2.number, n3.number;
