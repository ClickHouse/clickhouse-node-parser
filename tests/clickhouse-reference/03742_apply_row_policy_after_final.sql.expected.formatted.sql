-- Tags: no-parallel
-- Test for apply_row_policy_after_final setting with ReplacingMergeTree, https://github.com/ClickHouse/ClickHouse/issues/90986
SYSTEM DROP  TABLE IF EXISTS tab;

SYSTEM DROP  ROW POLICY IF EXISTS pol1 ON tab;

CREATE TABLE tab
(
    x UInt32,
    y String,
    version UInt32
)
ENGINE = ReplacingMergeTree(version)
ORDER BY x;

INSERT INTO tab;

INSERT INTO tab;

SELECT '--- raw';

SELECT *
FROM tab
ORDER BY
    x ASC,
    version ASC;

SELECT *
FROM tab FINAL
ORDER BY x ASC;

-- Create row policy that filters out rows where y = 'ccc'
CREATE ROW POLICY pol1 ON tab USING y != 'ccc' TO ALL;

SET apply_row_policy_after_final = 1;

SYSTEM DROP  ROW POLICY pol1 ON tab;

SYSTEM DROP  TABLE tab;

SYSTEM DROP  TABLE IF EXISTS tab2;

SYSTEM DROP  ROW POLICY IF EXISTS pol2 ON tab2;

CREATE TABLE tab2
(
    x UInt32,
    y String,
    version UInt32
)
ENGINE = ReplacingMergeTree(version)
ORDER BY x;

INSERT INTO tab2;

INSERT INTO tab2;

-- row policy on x (ORDER BY column) - should be applied before FINAL
CREATE ROW POLICY pol2 ON tab2 USING x != 1 TO ALL;

-- both rows with x=1 should be filtered out before FINAL
SELECT *
FROM tab2 FINAL
ORDER BY x ASC;

SYSTEM DROP  ROW POLICY pol2 ON tab2;

SYSTEM DROP  TABLE tab2;

SYSTEM DROP  TABLE IF EXISTS tab3;

SYSTEM DROP  ROW POLICY IF EXISTS pol3 ON tab3;

CREATE TABLE tab3
(
    x UInt32,
    y String,
    z UInt32,
    version UInt32
)
ENGINE = ReplacingMergeTree(version)
ORDER BY x;

INSERT INTO tab3;

INSERT INTO tab3;

CREATE ROW POLICY pol3 ON tab3 USING y != 'ccc' TO ALL;

SET apply_row_policy_after_final = 0;

-- PREWHERE z < 250 filters (1, 'ccc', 300, 2) and (2, 'ddd', 300, 2)
-- FINAL gets (1, 'aaa', 100, 1) and (2, 'bbb', 200, 1)
SELECT *
FROM tab3 FINAL
PREWHERE z < 250
ORDER BY x ASC;

SYSTEM DROP  ROW POLICY pol3 ON tab3;

SYSTEM DROP  TABLE tab3;

SYSTEM DROP  TABLE IF EXISTS tab4;

SYSTEM DROP  ROW POLICY IF EXISTS pol4 ON tab4;

CREATE TABLE tab4
(
    x UInt32,
    y String,
    version UInt32
)
ENGINE = ReplacingMergeTree(version)
ORDER BY x;

INSERT INTO tab4;

INSERT INTO tab4;

-- Row policy on y, but we SELECT only x
CREATE ROW POLICY pol4 ON tab4 USING y != 'ccc' TO ALL;

SELECT x
FROM tab4 FINAL
ORDER BY x ASC;

SELECT
    x,
    version
FROM tab4 FINAL
ORDER BY x ASC;

SYSTEM DROP  ROW POLICY pol4 ON tab4;

SYSTEM DROP  TABLE tab4;

SYSTEM DROP  TABLE IF EXISTS tab_final;

SYSTEM DROP  ROW POLICY IF EXISTS pol_final ON tab_final;

CREATE TABLE tab_final
(
    x UInt32,
    y String,
    version UInt32
)
ENGINE = ReplacingMergeTree(version)
ORDER BY x;

INSERT INTO tab_final;

INSERT INTO tab_final;

SET apply_prewhere_after_final = 1;

SELECT x
FROM tab_final FINAL
PREWHERE y != 'ccc'
ORDER BY x ASC;

SET apply_prewhere_after_final = 0;

SYSTEM DROP  TABLE tab_final;