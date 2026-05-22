-- Tags: no-parallel
-- Test for apply_row_policy_after_final setting with ReplacingMergeTree, https://github.com/ClickHouse/ClickHouse/issues/90986

DROP TABLE IF EXISTS tab;
DROP ROW POLICY IF EXISTS pol1 ON tab;
CREATE TABLE tab (x UInt32, y String, version UInt32) ENGINE = ReplacingMergeTree(version) ORDER BY x;
INSERT INTO tab VALUES (1, 'aaa', 1), (2, 'bbb', 1);
INSERT INTO tab VALUES (1, 'ccc', 2);
SELECT '--- raw';
SELECT * FROM tab ORDER BY x, version;
SELECT * FROM tab FINAL ORDER BY x;
-- Create row policy that filters out rows where y = 'ccc'
CREATE ROW POLICY pol1 ON tab USING y != 'ccc' TO ALL;
SET apply_row_policy_after_final = 1;
DROP ROW POLICY pol1 ON tab;
DROP TABLE tab;
DROP TABLE IF EXISTS tab2;
DROP ROW POLICY IF EXISTS pol2 ON tab2;
CREATE TABLE tab2 (x UInt32, y String, version UInt32) ENGINE = ReplacingMergeTree(version) ORDER BY x;
INSERT INTO tab2 VALUES (1, 'aaa', 1), (2, 'bbb', 1), (3, 'ccc', 1);
INSERT INTO tab2 VALUES (1, 'ddd', 2);
-- row policy on x (ORDER BY column) - should be applied before FINAL
CREATE ROW POLICY pol2 ON tab2 USING x != 1 TO ALL;
-- both rows with x=1 should be filtered out before FINAL
SELECT * FROM tab2 FINAL ORDER BY x;
DROP ROW POLICY pol2 ON tab2;
DROP TABLE tab2;
DROP TABLE IF EXISTS tab3;
DROP ROW POLICY IF EXISTS pol3 ON tab3;
CREATE TABLE tab3 (x UInt32, y String, z UInt32, version UInt32) ENGINE = ReplacingMergeTree(version) ORDER BY x;
INSERT INTO tab3 VALUES (1, 'aaa', 100, 1), (2, 'bbb', 200, 1);
INSERT INTO tab3 VALUES (1, 'ccc', 300, 2), (2, 'ddd', 300, 2);
CREATE ROW POLICY pol3 ON tab3 USING y != 'ccc' TO ALL;
SET apply_row_policy_after_final = 0;
-- PREWHERE z < 250 filters (1, 'ccc', 300, 2) and (2, 'ddd', 300, 2)
-- FINAL gets (1, 'aaa', 100, 1) and (2, 'bbb', 200, 1)
SELECT * FROM tab3 FINAL PREWHERE z < 250 ORDER BY x;
DROP ROW POLICY pol3 ON tab3;
DROP TABLE tab3;
DROP TABLE IF EXISTS tab4;
DROP ROW POLICY IF EXISTS pol4 ON tab4;
CREATE TABLE tab4 (x UInt32, y String, version UInt32) ENGINE = ReplacingMergeTree(version) ORDER BY x;
INSERT INTO tab4 VALUES (1, 'aaa', 1), (2, 'bbb', 1);
INSERT INTO tab4 VALUES (1, 'ccc', 2);
-- Row policy on y, but we SELECT only x
CREATE ROW POLICY pol4 ON tab4 USING y != 'ccc' TO ALL;
SELECT x FROM tab4 FINAL ORDER BY x;
SELECT x, version FROM tab4 FINAL ORDER BY x;
DROP ROW POLICY pol4 ON tab4;
DROP TABLE tab4;
DROP TABLE IF EXISTS tab_final;
DROP ROW POLICY IF EXISTS pol_final ON tab_final;
CREATE TABLE tab_final (x UInt32, y String, version UInt32) ENGINE = ReplacingMergeTree(version) ORDER BY x;
INSERT INTO tab_final VALUES (1, 'aaa', 1), (2, 'bbb', 1);
INSERT INTO tab_final VALUES (1, 'ccc', 2);
SET apply_prewhere_after_final = 1;
SELECT x FROM tab_final FINAL PREWHERE y != 'ccc' ORDER BY x;
SET apply_prewhere_after_final = 0;
DROP TABLE tab_final;
