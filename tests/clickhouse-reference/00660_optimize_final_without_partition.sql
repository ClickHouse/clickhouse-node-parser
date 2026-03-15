SET optimize_on_insert = 0;
CREATE TABLE partitioned_by_tuple (d Date, x UInt8, w String, y UInt8) ENGINE SummingMergeTree (y) PARTITION BY (d, x) ORDER BY (d, x, w);
SELECT * FROM partitioned_by_tuple ORDER BY d, x, w, y;
