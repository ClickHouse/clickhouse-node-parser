set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE tab_00610(d Date, x UInt32) ENGINE MergeTree(d, x, 8192);
CREATE MATERIALIZED VIEW mv_00610(d Date, y UInt64) ENGINE MergeTree(d, y, 8192) AS SELECT d, x + 1 AS y FROM tab_00610;
SELECT '-- Before DROP PARTITION --';
SELECT * FROM mv_00610 ORDER BY y;
