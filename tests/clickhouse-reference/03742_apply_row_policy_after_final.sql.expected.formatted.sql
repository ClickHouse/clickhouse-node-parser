SELECT '--- raw';

SELECT *
FROM tab
ORDER BY
    x ASC,
    version ASC;

SELECT *
FROM tab FINAL
ORDER BY x ASC;

-- both rows with x=1 should be filtered out before FINAL
SELECT *
FROM tab2 FINAL
ORDER BY x ASC;

-- PREWHERE z < 250 filters (1, 'ccc', 300, 2) and (2, 'ddd', 300, 2)
-- FINAL gets (1, 'aaa', 100, 1) and (2, 'bbb', 200, 1)
SELECT *
FROM tab3 FINAL
PREWHERE z < 250
ORDER BY x ASC;

SELECT x
FROM tab4 FINAL
ORDER BY x ASC;

SELECT
    x,
    version
FROM tab4 FINAL
ORDER BY x ASC;

SELECT x
FROM tab_final FINAL
PREWHERE y != 'ccc'
ORDER BY x ASC;