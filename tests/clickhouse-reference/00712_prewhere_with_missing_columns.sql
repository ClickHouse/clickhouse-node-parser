CREATE TABLE mergetree_00712 (x UInt8, s String) ENGINE = MergeTree ORDER BY tuple();
SELECT * FROM mergetree_00712;
SELECT * FROM mergetree_00712 ORDER BY x;
SELECT s FROM mergetree_00712 PREWHERE x AND y ORDER BY s;
SELECT s, y FROM mergetree_00712 PREWHERE x AND y ORDER BY s;
