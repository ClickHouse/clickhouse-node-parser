CREATE TABLE clear_column(x UInt32, y UInt32) ENGINE MergeTree ORDER BY x PARTITION by x;
INSERT INTO clear_column VALUES (1, 1), (2, 3);
SELECT * FROM clear_column ORDER BY x;
