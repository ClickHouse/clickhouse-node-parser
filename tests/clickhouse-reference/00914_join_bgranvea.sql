CREATE TABLE table1 (A String, B String, ts DateTime) ENGINE = MergeTree PARTITION BY toStartOfDay(ts)  ORDER BY (ts, A, B);
CREATE TABLE table2 (B String, ts DateTime) ENGINE = MergeTree PARTITION BY toStartOfDay(ts) ORDER BY (ts, B);
SELECT t1.B, t2.B FROM table1 t1 ALL INNER JOIN table2 t2 ON t1.B = t2.B ORDER BY t1.B, t2.B;
