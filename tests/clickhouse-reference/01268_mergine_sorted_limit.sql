CREATE TABLE tab (x UInt32, y UInt32) ENGINE = MergeTree() ORDER BY x;
SELECT * FROM tab ORDER BY x LIMIT 3 SETTINGS optimize_read_in_order=1;
SELECT * FROM tab ORDER BY x LIMIT 4 SETTINGS optimize_read_in_order=1;
