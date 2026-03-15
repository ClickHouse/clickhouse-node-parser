SET allow_suspicious_low_cardinality_types = 1;
CREATE TABLE tab1 (a1 Int32, b1 Int32, val UInt64) ENGINE = MergeTree ORDER BY a1;
CREATE TABLE tab2 (a2 LowCardinality(Int32), b2 Int32) ENGINE = MergeTree ORDER BY a2;
SELECT sum(val), count(val) FROM tab1 FULL OUTER JOIN tab2 ON b1 - 2 = a2 OR a1 = b2 SETTINGS join_use_nulls = 0;
SELECT sum(val), count(val) FROM tab1 FULL OUTER JOIN tab2 ON b1 - 2 = a2 OR a1 = b2 SETTINGS join_use_nulls = 1;
