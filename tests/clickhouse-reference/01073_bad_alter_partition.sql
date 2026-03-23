CREATE TABLE merge_tree (d Date) ENGINE = MergeTree ORDER BY d PARTITION BY d;
INSERT INTO merge_tree VALUES ('2020-01-01'), ('2020-01-02'), ('2020-01-03'), ('2020-01-04'), ('2020-01-05'), ('2020-01-06');
SELECT 1, * FROM merge_tree ORDER BY d;
SELECT 3, * FROM merge_tree ORDER BY d;
SELECT 4, * FROM merge_tree ORDER BY d;
SELECT 5, * FROM merge_tree ORDER BY d;
SELECT 6, * FROM merge_tree ORDER BY d;
